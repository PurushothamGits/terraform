pipeline {
  agent any
  stages {
    stage ('Codechekout') {
      steps {
        checkout scm
      }
    }
    stage('Terraform') {
      steps {
        dir('/var/lib/jenkins/workspace/terraform-ec2/Terraform/ec2/') {
          withEnv(["Instance_Type=${params.Instance_Type}"]) {
            sh "terraform init"
            sleep 20
            sh 'terraform apply -var "Instance_Type=${Instance_Type}" -auto-approve'
          }
        }
      }
    }
    stage ('Output') {
      steps {
        echo "${Instance_Type} has sucesfully created"
      }
    }
  }
}
