pipeline {
    agent any

    stages {
        // stage('Bypass passwd for jenkins') {
        //     steps{
        //         sh '''
        //             echo 'jenkins ALL=(ALL) NOPASSWD: ALL' | sudo tee -a /etc/sudoers
        //         '''
        //     }
        // }
        stage('Update WordPress about.php') {
            steps {
                sh '''  
                    sudo sed -i "s/WordPress Version/Test Jenkins With WordPress/g" /var/www/html/wp-admin/about.php
                '''
            }
        }

        stage('Deploy to Wordpress Container') {
            steps {
                sh '''
                    sudo docker restart fd8463a867f8
                '''
            }
        }
    }
}

