pipeline {
    agent any

    stages {
        stage('Build Docker') {
            steps {
                sh '''  
                    docker build -f redis/Dockerfile -t nhhan2504/jenkins:production-version2 .
                    docker login -u nhhan2504 -p LoveHoa2304 docker.io
                    docker push nhhan2504/jenkins:production-version2
                '''
            }
        }

        stage('Push image to docker hub')
        {
            steps {
                sh '''
                    docker build -f redis/Dockerfile -t nhhan2504/sandbox:version2 .
                    docker login -u nhhan2504 -p LoveHoa2304 docker.io
                    docker push nhhan2504/sandbox:version2
                '''
            }
        }

        stage('Deploy to Wordpress Container') {
            steps {
                sh '''
                    docker run --rm -p 6379:6379 --name my-redis nhhan2504/jenkins:production --sysctl net.core.somaxconn=65535
                '''
            }
        }
    }
}

