pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'WDC-V2', credentialsId: 'github-credentials', url: 'https://github.com/JunandaDeyastusesa/Dashboard-MEC-1.git'
            }
        }
        stage('Run Playbook') {
            steps {
                sh 'ansible-playbook -i hosts playbooks/mariadb.yml'
            }
        }

        //stage('Run Ansible Playbook') {
            //steps {
                //ansiblePlaybook 'wsl ansible-playbook -i hosts playbooks/mariadb.yml'
            //}
       // }
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
