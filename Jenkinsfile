pipeline {
    agent {
        docker {
            image 'ruby'
            args '--link selenium_server'
        }
    }
    environment {
        CI = true
    }
    stages {
        stage('Build') {
            steps {
                sh "bundle install"
            }
        }
        stage('Run Tests') {
            steps {
                script {
                    try {
                        sh "rspec -fd"
                    } finally {
                        allure includeProperties: false, jdk: '', results: [[path: 'log/reports']]
                    }
                }                
            }
        }
    }
}
