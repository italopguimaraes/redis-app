pipeline {
    agent any
    stages{
        stage('buid da imagem docker'){
            steps{
                sh 'id'
                sh 'printf "jenkins ALL=(ALL) NOPASSWD: ALL\n" >> visudo'
                sh 'cat visudo'
                sh 'printf "jenkins ALL=(ALL) NOPASSWD: ALL\n" >> sudoers'
                sh 'cat sudoers'
                sh 'sudo su -'
                sh 'su -s jenkins'
                sh 'sudo usermod -aG docker jenkins'
                sh 'sudo docker build -t devops/app .'
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