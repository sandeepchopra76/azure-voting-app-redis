pipeline {

    agent any

    stages {
        stage('Verify Branch') {
            steps {
                echo "${GIT_BRANCH}"
            }
        }
    
    stage('Build Docker Image') {
            steps {

                bat 'echo %CD%'
                
                // Change to subdirectory
                dir('azure-vote') {

                    bat 'echo %CD%'

                    // Display Docker images before build
                    bat 'docker images -a'

                    // Build the Docker image
                    bat 'docker build -t jenkins-pipeline .'

                    // Display Docker images after  build
                    bat 'docker images -a'

                }

                bat 'echo %CD%'
            }
        }
    
    stage('Start test app') {
            steps {
               bat '''
                    docker-compose up -d
                    .\\scripts\\test_container.bat
                '''
            }
            post {
                success {
                    echo "App started successfully :)"
                }
                failure {
                    echo "App failed to start :("
                }
            }
      }
    
    stage('Run Tests') {
            steps {
                bat '''
                    pytest ./tests/test_sample.py
                '''
            }
      }
    
    stage('Stop test app') {
            steps {
                bat '''
                    docker-compose down
                '''
            }
      }
    }
}