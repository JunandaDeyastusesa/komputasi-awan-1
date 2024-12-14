pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'WDC-V2', credentialsId: 'github-credentials', url: 'https://github.com/JunandaDeyastusesa/Dashboard-MEC-1.git'
            }
        }
        stage('Install Dependencies') {
            steps {
                // Gunakan bat jika Windows
                bat 'ansible-galaxy install -r requirements.yml'
            }
        }
        stage('Run Ansible Playbook') {
            steps {
                // Jika menjalankan playbook di Windows
                bat 'ansible-playbook -i hosts playbooks/mariadb.yml'
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
