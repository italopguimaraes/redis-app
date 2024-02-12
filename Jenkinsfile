pipeline {
    agent any
    stages{
        stage('buid da imagem docker'){
            steps{
                sh 'groupadd docker'
                sh 'usermod -aG docker italopguimaraes'
                sh 'su -s italopguimaraes'
                sh 'docker build -t devops/app .'
            }
        }
        stage('subir docker compose redis e app'){
            steps{
                sh 'sudo docker-compose up --buid -d'
            }
        }
        stage('sleep para subida de containers'){
            steps{
                sh 'sudo sleep 10'
            }
        }
        stage('teste de aplicação'){
            steps{
                sh 'sudo chmod +x teste-app.sh'
                sh 'sudo teste-app.sh'
                }
            }
        stage('derruba o conteiner'){
            steps{
                sh 'sudo docker-compose down'
                }
            }
    }
}