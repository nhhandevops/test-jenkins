pipeline {
    agent any

    stages {
        stage('Build and Push Docker image production to docker hub') {
            steps {
                sh '''  
                    docker build -f redis/Dockerfile -t nhhan2504/jenkins:production-version4 .
                    docker login -u nhhan2504 -p LoveHoa2304 docker.io
                    docker push nhhan2504/jenkins:production-version4
                '''
            }
        }

        stage('Build and Push image sandbox to docker hub')
        {
            steps {
                sh '''
                    docker build -f redis/Dockerfile -t nhhan2504/sandbox:version4 .
                    docker login -u nhhan2504 -p LoveHoa2304 docker.io
                    docker push nhhan2504/sandbox:version4
                '''
            }
        }

        stage('Deploy to Wordpress Container') {
            steps {
                sh '''
                    docker run -d --sysctl net.core.somaxconn=65535 -p 6379:6379 --name my-redis nhhan2504/jenkins:production-version4
                '''
            }
        }
    }
}

