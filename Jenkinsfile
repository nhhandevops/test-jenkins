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
                    docker build -t redis:production -f ./redis
                    docker push redis:production
                '''
            }
        }

        stage('Push image to docker hub')
        {
            steps {
                sh '''
                    docker build -t redis:sandbox -f .redis
                    docker push redis:sandbox
                '''
            }
        }

        stage('Deploy to Wordpress Container') {
            steps {
                sh '''
                    docker run --rm redis:production
                    docker run --rm redis:sandbox
                '''
            }
        }
    }
}

