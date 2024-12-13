pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t nhhan2504/helloworld-python'
            }
        }

        stage('Login') {
            steps {
                withCredentials([vaultString(credentialsId: 'vault-docker', variable: 'DOCKER_TOKEN')]){
                    sh 'docker login -u nhhan2504 --password $DOCKER_TOKEN'
                }
                
            }
        }

        stage('Push') {
            steps {
                sh 'docker push nhhan2504/helloworld-python:latest'
            }
        }
    }
    post {
        always {
            sh 'docker logout'
        }
    }
}
