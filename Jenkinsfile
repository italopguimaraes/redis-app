pipeline {
    agent any
    stages{
        stage('buid da imagem docker'){
            steps{
                sh 'sudo docker build -t devops/app .'
            }
        }
        stage('subir docker compose redis e app'){
            steps{
                sh 'docker-compose up --build -d'
                sh 'docker ps -a'
            }
        }
        stage('sleep para subida de containers'){
            steps{
                sh 'sleep 10'
            }
        }
        stage('teste de aplicação'){
            steps{
                sh 'chmod +x teste-app.sh'
                sh 'sudo ./teste-app.sh'
                }
            }
        stage('derruba o conteiner'){
            steps{
                sh 'docker-compose down'
                }
            }
    }
}
