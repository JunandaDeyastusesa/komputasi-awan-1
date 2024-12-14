pipeline {
 agent any
 stages {
 stage('Clone Repository') {
 steps {
 git branch: 'WDC-V2', credentialsId: 'github-credentials', url: 'https://github.com/JunandaDeyastusesa/komputasi-awan-1.git'

 }
 }
 stage('Install Dependencies') {
 steps {
 sh 'ansible-galaxy install -r requirements.yml'
 }
 }
 stage('Run Ansible Playbook') {
 steps {
 ansiblePlaybook credentialsId: 'your-credentials-id', inventory: 'hosts', playbook:
'playbooks/mariadb.yml'
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
