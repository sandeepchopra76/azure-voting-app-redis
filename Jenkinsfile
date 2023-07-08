@Library('jenkins-shared-library') _

pipeline {
    agent any

    stages {
        stage('Verify Branch') {
            steps {
                script {
                    env.STAGE_START_TIME = System.currentTimeMillis().toString()
                    echo "${GIT_BRANCH}"
                }
            }
            post {
                always {
                    script {
                        PrometheusMetrics('Verify Branch', env.STAGE_START_TIME.toLong(), System.currentTimeMillis(), currentBuild.currentResult)
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    env.STAGE_START_TIME = System.currentTimeMillis().toString()
                    dir('azure-vote') {
                        bat 'echo %CD%'
                        bat 'docker images -a'
                        bat 'docker build -t jenkins-pipeline .'
                        bat 'docker images -a'
                    }
                }
            }
            post {
                always {
                    script {
                        PrometheusMetrics('Build Docker Image', env.STAGE_START_TIME.toLong(), System.currentTimeMillis(), currentBuild.currentResult)
                    }
                }
            }
        }
    }
}
