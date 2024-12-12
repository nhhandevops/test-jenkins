pipeline {
    agent any
    stages {
        stage("verify install") {
            steps {
                sh '''
                    docker version
                    docker info
                    docker-compose version
                '''
            }
        }
            
    }
}
