
@Library('jenkins-shared-library') _

pipeline {

    agent any

    stages {
        
        stage('Verify Branch') {
            steps {
                echo "${GIT_BRANCH}"
            }
             pre {
                script {
                    def startTime = System.currentTimeMillis()
                    env.START_TIME = startTime
                }
             }
            post {
                always {
                    PrometheusMetrics('Verify Branch', env.START_TIME.toLong(), System.currentTimeMillis(), currentBuild.currentResult)
                }
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
            pre {
                script {
                    def startTime = System.currentTimeMillis()
                    env.START_TIME = startTime
                }
            }
             post {
                always {
                    PrometheusMetrics('Build Docker Image', env.START_TIME.toLong(), System.currentTimeMillis(), currentBuild.currentResult)
                }
            }
        }
    }
}