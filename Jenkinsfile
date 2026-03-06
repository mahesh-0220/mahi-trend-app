pipeline {
    agent any

    environment {
        // Correct DockerHub username: maheshdevops0220
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds')
        IMAGE_NAME = "maheshdevops0220/trend-app"
    }

    stages {
        // Stage removed because Jenkins does this automatically for 'Pipeline from SCM'
        
        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME}:latest ."
                }
            }
        }

        stage('Login and Push') {
            steps {
                script {
                    sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
                    sh "docker push ${IMAGE_NAME}:latest"
                }
            }
        }
    }

    post {
        success {
            echo "Successfully built and pushed ${IMAGE_NAME} to DockerHub!"
        }
        failure {
            echo "Build failed. Please check the Console Output in Jenkins."
        }
    }
}
