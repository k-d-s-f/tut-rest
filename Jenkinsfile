pipeline {
    agent any
    environment {
        dockerimagename = "kdsf2023/tut-rest"
        dockerImage = ""
    }
    stages {

       stage('GitSCM') {
           steps{
               checkout([$class: 'GitSCM',
               branches: [[name: '*/main']],
               extensions: [],
               userRemoteConfigs: [[credentialsId: 'tut', url: 'https://github.com/k-d-s-f/tut-rest.git']]])

           }
        }
       stage('Build artifacts') {
            steps {
                sh 'mvn clean install'
            }
        }
       stage('Build image') {
          steps{
            script {
              dockerImage = docker.build dockerimagename
            }
          }
        }
       stage('Pushing Image') {
            environment {
                     registryCredential = 'dockerhub'
                 }
            steps{
              script {
                docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) {
                  dockerImage.push("latest")
                }
              }
            }
        }
       stage('Deploying to Kubernetes') {
            steps {
                script {
                    kubernetesDeploy(configs: "deployment.yaml", "service.yaml")
                }
            }
        }
    }
}