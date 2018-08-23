pipeline {
    //agent {
    //    docker {
    //        image 'ruby'
    //        args '--link selenium_server'
    //    }
    //}
    agent { 
        dockerfile { 
            args '--link selenium_server'                  
            reuseNode true
        }
    }
    environment {
        CI = true
    }
    stages {
        stage('Preparation') {
            steps {
                sh "bundle install"
                sh "npm install allure-commandline -g"
            }
        }
        stage('Run Tests') {
            steps {
                script {
                    try {
                        sh "rspec -fd"
                    } finally {
                        sh "allure generate ./log/reports/ ./allure-report/ --clean"
                        publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'allure-report', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: ''])
                    }
                }                
            }
        }
    }
}
