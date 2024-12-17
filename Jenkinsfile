pipeline {
    agent any

    environment {
        ANSIBLE_HOST_KEY_CHECKING = 'false'  // Menonaktifkan pengecekan host key untuk SSH (optional)
        ANSIBLE_INVENTORY = 'hosts' // Path ke file inventory
        PLAYBOOK_PATH = 'requirement.yml' // Path ke playbook PHP
        MYSQL_PLAYBOOK_PATH = 'playbooks/mariadb.yml' // Path ke playbook MySQL
        ANSIBLE_USER = 'juna'  // Ganti dengan username yang digunakan untuk SSH
        ANSIBLE_SSH_KEY = credentials('github-credentials') // Pastikan SSH key disimpan di Jenkins
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout kode dari repository GitHub
                git branch: 'WDC-V2', url: 'https://github.com/JunandaDeyastusesa/komputasi-awan-1.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    // Install Ansible di Jenkins jika diperlukan
                    sh 'sudo apt-get update'
                    sh 'sudo apt-get install -y ansible'
                }
            }
        }

        stage('Run MySQL Setup') {
            steps {
                script {
                    // Menjalankan playbook MySQL untuk mengonfigurasi database
                    sh "ansible-playbook -i ${ANSIBLE_INVENTORY} ${MYSQL_PLAYBOOK_PATH} --user ${ANSIBLE_USER} --private-key ${ANSIBLE_SSH_KEY}"
                }
            }
        }

        stage('Deploy PHP Application') {
            steps {
                script {
                    // Menjalankan playbook PHP untuk meng-deploy aplikasi
                    sh "ansible-playbook -i ${ANSIBLE_INVENTORY} ${PLAYBOOK_PATH} --user ${ANSIBLE_USER} --private-key ${ANSIBLE_SSH_KEY}"
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment successful!'
        }

        failure {
            echo 'Deployment failed.'
        }
    }
}
