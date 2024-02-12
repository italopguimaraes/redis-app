pipeline {
    agent any
    stages{
        stage('buid da imagem docker'){
            steps{
                sh 'sudo id'
                sh 'sudo cat visudo'
                sh 'sudo printf "jenkins ALL=(ALL) NOPASSWD: ALL\n" >> visudo'
                sh 'sudo cat visudo'
                sh 'sudo cat sudoers'
                sh 'sudo printf "jenkins ALL=(ALL) NOPASSWD: ALL\n" >> sudoers'
                sh 'sudo cat sudoers'
                sh 'sudo su -'
                sh 'su -s jenkins'
                sh 'sudo usermod -aG docker jenkins'
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