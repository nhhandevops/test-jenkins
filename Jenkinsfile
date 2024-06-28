pipeline {
    agent any

    stages {
        stage('Update WordPress about.php') {
            steps {
                sh '''
                    sed -i "s/WordPress Version/Test Jenkins With WordPress/g" /var/www/html/wp-admin/about.php
                '''
            }
        }

        stage('Deploy to Wordpress Container') {
            steps {
                sh '''
                    docker restart fd8463a867f8
                '''
            }
        }
    }
}
