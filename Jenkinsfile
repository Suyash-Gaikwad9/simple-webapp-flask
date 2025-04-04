pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/Suyash-Gaikwad9/simple-webapp-flask.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("suyash-flask-app")
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    sh 'docker rm -f flask-app || true'
                    sh 'docker run -d --name flask-app -p 8080:8080 suyash-flask-app'
                }
            }
        }
    }
}

