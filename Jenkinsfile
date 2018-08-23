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
                sh "./tools/prep.sh"
            }
        }
        stage('Run Tests') {
            steps {
                script {
                    try {
                        sh "rspec -fd"
                    } finally {
                        // input message: 'Testes finalizados deseja subir em produção?  (Clique em "Sim" para continuar)'
                        sh "./tools/allure-2.7.0/bin/allure generate ./log/reports/ ./log/publish-allure/ --clean"
                        publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'log/publish-allure', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: ''])
                    }
                }                
            }
        }
    }
}
