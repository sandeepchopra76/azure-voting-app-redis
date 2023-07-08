@Library('SharedLibrary')

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
    post {
        always {
                PrometheusMetrics()
            }

            // Print WORKSPACE location
            script {
                echo "WORKSPACE location: ${env.WORKSPACE}"
            }

            // Publish Prometheus metrics
            prometheus([
                metricsPath: "${env.WORKSPACE}/prometheus_metrics.txt",
                port: 8082
            ])
        }
    }
}