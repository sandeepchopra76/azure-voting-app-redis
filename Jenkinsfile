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
                    def status = currentBuild.result == 'SUCCESS' ? 1 : 0
                    PrometheusMetrics('Verify Branch', startTime, endTime, status)
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
                    def status = currentBuild.result == 'SUCCESS' ? 1 : 0
                    PrometheusMetrics('Build Docker Image', startTime, endTime, status)
                }
            }
        }
    }
}
