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
        stage('Preparation') {
            steps {
                sh "bundle install"
                sh "wget https://bintray.com/qameta/generic/download_file?file_path=io%2Fqameta%2Fallure%2Fallure%2F2.7.0%2Fallure-2.7.0.zip"
                sh "if [ -d allure-2.7.0 ]; then rmdir allure-2.7.0; fi"
                sh "unzip *.zip"
                sh "rm *.zip"
            }
        }
        stage('Run Tests') {
            steps {
                script {
                    try {
                        sh "rspec -fd"
                    } finally {
                        sh "./allure-2.7.0/bin/allure generate ./log/reports/ ./allure-report/ --clean"
                        publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'allure-report', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: ''])
                    }
                }                
            }
        }
    }
}
