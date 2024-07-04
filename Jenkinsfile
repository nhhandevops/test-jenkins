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
                    docker build -f redis/Dockerfile -t nhhan2504:jenkins .
                    docker push nhhan2504:jenkins
                '''
            }
        }

        stage('Push image to docker hub')
        {
            steps {
                sh '''
                    docker build -f redis -t nhhan2504:sandbox .
                    docker push nhhan2504:sandbox
                '''
            }
        }

        stage('Deploy to Wordpress Container') {
            steps {
                sh '''
                    docker run --rm nhhan2504:jenkins
                    docker run --rm nhhan2504:sandbox
                '''
            }
        }
    }
}

