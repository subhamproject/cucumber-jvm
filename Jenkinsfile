#!groovy
pipeline {
  options {
    buildDiscarder(logRotator(numToKeepStr: '10'))
  }
  agent any
  stages {
    stage('Build') {
      steps {
        script {
          sh '''
            SBI/build.sh
          '''
        }
      }
    }
    stage('Test') {
      steps {
        script {
          sh '''
            SBI/test.sh
          '''
        }
      }
    }
    stage('Docker Image Build') {
      steps {
        script {
          sh '''
           echo "building image"
                      '''
        }
      }
    }
stage('Push To ECR') {
      steps {
        script {
          sh '''
            echo "Pushing it to ECR"
                      '''
        }
      }
    }
stage('Deploy Image to ECS') {
      steps {
        script {
          sh '''
           echo "Deploying Image to ECS"
                      '''
        }
      }
	post {
                always {
                    //generate cucumber reports
                    cucumber '**/cucumber-report*.json'
                }
            }
	  }
}
}
