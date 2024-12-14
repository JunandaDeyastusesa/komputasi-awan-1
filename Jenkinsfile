pipeline {
    agent any
    stages {
        stage('Validate') {
            steps {
                script {
                    sh 'ls -la'
                }
            }
        }
        stage('Install Dependencies') {
            steps {
                // Menginstal dependencies dari requirements.yml
                sh 'ansible-galaxy install -r requirements.yml'
            }
        }
        stage('Run Ansible Playbook') {
            steps {
                // Menjalankan playbook dengan kredensial dan inventory yang benar
                ansiblePlaybook inventory: 'hosts', playbook: 'playbooks/mariadb.yml'
            }
        }
    }
    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}
