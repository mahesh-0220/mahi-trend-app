pipeline {
    agent any
    
    environment {
        // This 'dockerhub-creds' MUST match the ID you created in Jenkins Credentials
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds')
        // Using your corrected DockerHub username: admin
        IMAGE_NAME = "maheshdevops0220/trend-app"
    }
    
    stages {
        stage('Checkout') {
            steps {
                // Pulls your application code from GitHub
                git 'https://github.com/mahesh-0220/mahi-trend-app.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    // Builds the image using the Dockerfile you verified in WSL
                    sh "docker build -t ${IMAGE_NAME}:latest ."
                }
            }
        }
        
        stage('Login and Push') {
            steps {
                script {
                    // Logs into DockerHub using the admin credentials and pushes the image
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
