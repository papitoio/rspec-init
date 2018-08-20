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
                        sh "bundle rspec -fd"
                    } finally {
                        // cucumber fileIncludePattern: '**/*.json', jsonReportDirectory: 'log', sortingMethod: 'ALPHABETICAL'
                    }
                }                
            }
        }
    }
}