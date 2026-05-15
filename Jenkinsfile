pipeline {
    agent any
    environment {
        DOCKERHUB_IMAGE = 'nhhan2504/helloworld-python'
        SONAR_PROJECT_KEY = 'test-app'
    }
    stages {
        stage('Syntax Check') {
            steps {
                sh 'python3 -m py_compile hello.py'
            }
        }
        stage('SonarQube Analysis') {
            steps {
                script {
                    def scannerHome = tool 'SonarScanner'
                    withSonarQubeEnv('sonarqube') {
                        withCredentials([string(credentialsId: 'sonarqube-token', variable: 'SONAR_TOKEN')]) {
                            withEnv(["SCANNER_HOME=${scannerHome}"]) {
                                sh '''
                                    $SCANNER_HOME/bin/sonar-scanner \
                                      -Dsonar.projectKey=$SONAR_PROJECT_KEY \
                                      -Dsonar.projectName="Test App" \
                                      -Dsonar.sources=. \
                                      -Dsonar.exclusions=.git/**,**/__pycache__/**,.venv/** \
                                      -Dsonar.host.url=$SONAR_HOST_URL \
                                      -Dsonar.token=$SONAR_TOKEN
                                '''
                            }
                        }
                    }
                }
            }
        }
        stage('Quality Gate') {
            steps {
                timeout(time: 3, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }
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
