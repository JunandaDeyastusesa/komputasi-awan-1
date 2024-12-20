pipeline {
    agent any
    environment {
        // Environment variables for MySQL connection
        MYSQL_HOST = 'mysql_db'    // Nama service MySQL yang didefinisikan dalam Docker Compose
        MYSQL_USER = 'mec'
        MYSQL_PASSWORD = 'root'
        MYSQL_DB = 'db_bimbelonline'
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'WDC-V2', url: 'https://github.com/JunandaDeyastusesa/komputasi-awan-1.git'
            }
        }
        stage('Run MySQL and PHP') {
            steps {
                script {
                    // Pull MySQL image and PHP environment image
                    def mysql = docker.image('mysql:latest')
                    def phpEnv = docker.image('junandad/dashboard-mec-php-env')

                    // Pull the latest images
                    mysql.pull()
                    phpEnv.pull()

                    // Run MySQL container
                    def mysqlContainer = mysql.run('-e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=db_bimbelonline -e MYSQL_USER=mec -e MYSQL_PASSWORD=root')

                    // Wait for MySQL to be ready before running the PHP app
                    sleep(10)

                    // Run PHP environment container and link it to MySQL
                    phpEnv.run("-e MYSQL_HOST=${MYSQL_HOST} -e MYSQL_USER=${MYSQL_USER} -e MYSQL_PASSWORD=${MYSQL_PASSWORD} -e MYSQL_DB=${MYSQL_DB} -p 9000:80 -w /var/www/html")

                    // Ensure both containers are running
                    mysqlContainer.waitFor()
                    phpEnv.waitFor()
                }
            }
        }
    }
}
