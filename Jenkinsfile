pipeline {
    agent any
    stages{
        stage('buid da imagem docker'){
            steps{
                sh 'id'
                sh 'grep "docker" /etc/group'
                sh 'docker build -t devops/app .'
                sh 'cat etc/visudo'
                sh 'cat etc/sudoers'
                sh 'cat /etc/sudoers.d/jenkins'
                sh 'sudo su -'
                sh 'sudo usermod -aG docker jenkins'
                sh 'su -s jenkins'
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
