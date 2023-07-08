
@Library('jenkins-shared-library') _

pipeline {

    agent any

    stages {
        
        stage('Verify Branch') {
            steps {

                script {
                    env.START_TIME = System.currentTimeMillis()
                }

                echo "${GIT_BRANCH}"

                script {
                    PrometheusMetrics('Verify Branch', env.START_TIME.toLong(), System.currentTimeMillis(), currentBuild.result.toString())
                }
            }
        }
    
    stage('Build Docker Image') {
            
            steps {

                script {
                    env.START_TIME = System.currentTimeMillis()
                }
                
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

                script {
                    PrometheusMetrics('Build Docker Image', env.START_TIME.toLong(), System.currentTimeMillis(), currentBuild.result.toString())
                }
            }
            
        }
    }
}