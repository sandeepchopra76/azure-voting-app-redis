@Library('jenkins-shared-library') _

pipeline {
    agent any

    stages {
        stage('Verify Branch') {
            steps {
                script {
                    def startTime = System.currentTimeMillis()
                    echo "${GIT_BRANCH}"
                    def endTime = System.currentTimeMillis()
                    PrometheusMetrics('Verify Branch', startTime, endTime, currentBuild.result)
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def startTime = System.currentTimeMillis()
                    dir('azure-vote') {
                        bat 'echo %CD%'
                        bat 'docker images -a'
                        bat 'docker build -t jenkins-pipeline .'
                        bat 'docker images -a'
                    }
                    def endTime = System.currentTimeMillis()
                    PrometheusMetrics('Build Docker Image', startTime, endTime, currentBuild.result)
                }
            }
        }
    }
}
