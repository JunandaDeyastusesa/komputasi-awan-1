pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                // Memastikan menggunakan kredensial yang benar
                git branch: 'WDC-V2', credentialsId: 'github-credentials', url: 'https://github.com/JunandaDeyastusesa/Dashboard-MEC-1.git'
            }
        }
        stage('Install Dependencies') {
            steps {
                // Install dependencies menggunakan Ansible tanpa menggunakan nohup
                sh 'ansible-galaxy install -r requirements.yml'
            }
        }
        stage('Run Ansible Playbook') {
            steps {
                // Menjalankan playbook dengan kredensial Ansible yang sesuai
                ansiblePlaybook credentialsId: 'your-credentials-id', inventory: 'hosts', playbook: 'playbooks/mariadb.yml'
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
