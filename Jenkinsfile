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
                    def mysqlContainer = mysql.run('-e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=db_bimbelonline -e MYSQL_USER=mec -e MYSQL_PASSWORD=root -p 3306:3306')

                    // Wait for MySQL to be ready before running the PHP app
                    echo 'Waiting for MySQL to be ready...'
                    sleep(20) // Tunda selama 20 detik untuk MySQL siap

                    // Run PHP environment container and link it to MySQL
                    def phpContainer = phpEnv.run("-e MYSQL_HOST=${MYSQL_HOST} -e MYSQL_USER=${MYSQL_USER} -e MYSQL_PASSWORD=${MYSQL_PASSWORD} -e MYSQL_DB=${MYSQL_DB} -p 9000:80 -w /var/www/html")

                    // Optionally wait for PHP container to run, but `waitFor` isn't needed
                    echo 'Both containers should now be running.'
                }
            }
        }
    }
}
