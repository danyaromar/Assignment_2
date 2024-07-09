pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from GitHub
                git credentialsId: 'your-github-credentials-id', url: 'https://github.com/your-username/your-repo.git'
            }
        }
        
        stage('Build') {
            steps {
                // Build your application (e.g., Maven, Gradle, etc.)
                sh 'mvn clean package'
            }
        }

        stage('Test') {
            steps {
                // Run tests (if applicable)
                sh 'mvn test'
            }
        }

        stage('Docker Build & Push') {
            steps {
                // Build Docker image
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                        def customImage = docker.build('your-dockerhub-username/your-image-name')
                        customImage.push()
                    }
                }
            }
        }
    }
}
