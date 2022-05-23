pipeline {
  agent any
    tools {
       terraform 'terraform'
    }
    stages {
        stage('terraform format') {
            steps{
                withAWS(credentials: 'AWS_KEYS', region: 'us-east-1') {
                sh 'terraform -chdir=./terraform fmt'
                }
            }
        }
        stage('terraform init'){
          steps{
             withAWS(credentials: 'AWS_KEYS', region: 'us-east-1') {
                sh 'terraform -chdir=./terraform init'
                }
          }
        }
        stage('terraform plan'){
          steps{
             withAWS(credentials: 'AWS_KEYS', region: 'us-east-1') {
               sh 'terraform -chdir=./terraform plan --var-file dev.tfvars'
             }
          }
        }
        stage('terraform build and using outputs'){
          steps{
             withAWS(credentials: 'AWS_KEYS', region: 'us-east-1') {
                sh 'terraform -chdir=./terraform apply --auto-approve --var-file dev.tfvars '
                sh 'chmod +x ips-script.sh'
                sh './ips-script.sh'
                sh 'cat /var/jenkins_home/.ssh/config'
                sh 'cat ./ansible/group_vars/slaves.yaml'
                sh 'cat ./ansible/group_vars/proxy.yaml'
                sh 'cat ./ansible/files/nginx.conf'
                sh 'terraform -chdir=./terraform output -raw elasticache-endpoint'
                sh 'terraform -chdir=./terraform output -raw username_rds'
                }
          }
        }
        
        stage('Ansible Configuration'){
          steps{
            sh 'cd ansible'
            // ping the hosts 
            ansiblePlaybook( 
              playbook: '/var/jenkins_home/workspace/infrastructure-pipeline/ansible/ping.yaml',
              inventory: '/var/jenkins_home/workspace/infrastructure-pipeline/ansible/inventory', 
              credentialsId: 'ansible-us-east',
              become : true,
              becomeUser:'root',
              hostKeyChecking:false,
              installation:'ansible',
              colorized: true) 

            // configure the private instance as a Jenkins slave 
            ansiblePlaybook( 
              playbook: '/var/jenkins_home/workspace/infrastructure-pipeline/ansible/configure-slave.yaml',
              inventory: '/var/jenkins_home/workspace/infrastructure-pipeline/ansible/inventory', 
              credentialsId: 'ansible-us-east',
              become : true,
              becomeUser:'root',
              hostKeyChecking:false,
              installation:'ansible',
              colorized: true) 

            // configure the public as a nginx proxy for the Jenkins slave
            ansiblePlaybook( 
              playbook: '/var/jenkins_home/workspace/infrastructure-pipeline/ansible/proxy.yaml',
              inventory: '/var/jenkins_home/workspace/infrastructure-pipeline/ansible/inventory', 
              credentialsId: 'ansible-us-east',
              become : true,
              becomeUser:'root',
              hostKeyChecking:false,
              installation:'ansible',
              colorized: true) 
          }
          post {
              // Infrastructure build success
                success {
                   slackSend(channel: 'dev-ops', color: 'good', message: "Infrastructure build success - ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>)")
               }
               // Infrastructure build failure
               failure {
                   slackSend(channel: 'dev-ops', color: 'danger', message: "Terraform build failure - ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>)")
               }
               // Any case Notificatiom
               always {
                   slackSend message: 'A new infrasture destrbuildoy  update'
               }
            }
        }
    stage('clean workspace') {
      steps {
        cleanWs()
    }   
    }
    }
     
  }