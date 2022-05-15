pipeline {
  agent any
    tools {
       terraform 'terraform'
    }
    stages {
        stage('terraform format check') {
            steps{
                withAWS(credentials: 'AWS_KEYS', region: 'us-east-1') {
                sh 'terraform fmt'
                sh 'terraform init'
                // sh 'terraform workspace new prod'
                sh 'terraform apply --auto-approve --var-file prod.tfvars'
                }
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