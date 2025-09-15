pipeline {
    agent any
    environment {
        IMAGE_NAME = "jenkins-demo-app"
        APP_PORT = "3000"
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                sh '''
                TAG=$(git rev-parse --short HEAD)
                docker build -t ${IMAGE_NAME}:$TAG .
                '''
            }
        }
        stage('Deploy Container') {
            steps {
                sh '''
                TAG=$(git rev-parse --short HEAD)

                # Stop & remove old container if running
                if [ "$(docker ps -q -f name=${IMAGE_NAME})" ]; then
                    docker stop ${IMAGE_NAME} || true
                    docker rm ${IMAGE_NAME} || true
                fi

                # Run new container mapped to port 80
                docker run -d --restart unless-stopped --name ${IMAGE_NAME} -p 80:${APP_PORT} ${IMAGE_NAME}:$TAG
                '''
            }
        }
    }
    post {
        always {
            sh 'docker image prune -f || true'
        }
    }
}
