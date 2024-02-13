pipeline {
    agent any
    stages{
        stage('buid da imagem docker'){
            steps{
                sh 'id'
                sh 'grep "docker" /etc/group'
                sh 'docker build -t devops/app .'
            }
        }
        stage('subir docker compose redis e app'){
            steps{
                sh 'docker-compose up --buid -d'
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
                sh 'teste-app.sh'
                }
            }
        stage('derruba o conteiner'){
            steps{
                sh 'docker-compose down'
                }
            }
    }
}
