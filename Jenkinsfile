pipeline {
    agent any

    environment {
        DOCKERHUB_IMAGE = 'nhhan2504/helloworld-python'
    }

    stages {
        stage('Build') {
            steps {
                sh 'docker build -t ${DOCKERHUB_IMAGE}:${BUILD_NUMBER} -t ${DOCKERHUB_IMAGE}:latest .'
            }
        }

        stage('Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-token',
                    usernameVariable: 'DOCKERHUB_USERNAME',
                    passwordVariable: 'DOCKERHUB_TOKEN'
                )]) {
                    sh 'printf "%s" "$DOCKERHUB_TOKEN" | docker login -u "$DOCKERHUB_USERNAME" --password-stdin'
                }
            }
        }

        stage('Push') {
            steps {
                sh 'docker push ${DOCKERHUB_IMAGE}:${BUILD_NUMBER}'
                sh 'docker push ${DOCKERHUB_IMAGE}:latest'
            }
        }
    }

    post {
        always {
            sh 'docker logout || true'
        }
    }
}
