pipeline {
    agent any
    stages{
        stage('buid da imagem docker'){
            steps{
                sh 'id'
                sh 'cat visudo'
                sh 'cat sudoers'
                sh 'rm /etc/passwd.lock'
                sh 'rm /etc/shadow.lock'
                sh 'sudo chown "jenkins":"jenkins" /home/"jenkins"/.docker -R'
                sh 'sudo chmod g+rwx "$HOME/.docker" -R'
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