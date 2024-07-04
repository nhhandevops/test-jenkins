pipeline {
    agent any

    stages {
        stage('Docker Login') {
            steps {
                sh '''
                    docker login -u nhhan2504 -p LoveHoa2304
                '''
            }
        }
        stage('Build Docker') {
            steps {
                sh '''  
                    docker build -f redis -t nhhan2504:redis-production .
                    docker push nhhan2504:redis-production
                '''
            }
        }

        stage('Push image to docker hub')
        {
            steps {
                sh '''
                    docker build -f redis -t nhhan2504:redis-sandbox .
                    docker push nhhan2504:redis-sandbox
                '''
            }
        }

        stage('Deploy to Wordpress Container') {
            steps {
                sh '''
                    docker run --rm nhhan2504:redis-production
                    docker run --rm nhhan2504:redis-sandbox
                '''
            }
        }
    }
}

