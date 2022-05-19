pipeline {
  agent any
    tools {
       terraform 'terraform'
       ansible 'ansible'
    }
    stages {
        stage('terraform format') {
            steps{
                withAWS(credentials: 'AWS_KEYS', region: 'us-east-1') {
                sh 'terraform fmt'
                }
            }
        }
        stage('terraform init'){
          steps{
             withAWS(credentials: 'AWS_KEYS', region: 'us-east-1') {
                sh 'terraform init'
                }
          }
        }
        stage('terraform build'){
          steps{
             withAWS(credentials: 'AWS_KEYS', region: 'us-east-1') {
                sh 'terraform apply --auto-approve --var-file dev.tfvars'
                }
          }
        }
        stage('Testing outcome of local provisioner'){
          steps{
            sh 'cat ./ansible/group_vars/proxy.yaml'
            sh 'cat ./ansible/group_vars/slaves.yaml'
            sh 'cd ansible'
          }
        }
    // stage('clean workspace') {
    //   steps {
    //     cleanWs()
    // }   
    // }
    }
     
  }
/* Plugins
1. Pipeline AWS steps to use the with
2. cloudBees AWS credentials to save the credentials in jenkins

*/ 