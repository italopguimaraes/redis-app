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
        stage('sonar validation'){
            steps{
                script{
                    scannerHome= tool 'sonar-scanner';
                }
                withSonarQubeEnv('sonar-server')
                {   sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=redis-app -Dsonar.sources=. -Dsonar.host.url=${env.SONAR_HOST_URL} -Dsonar.login=${env.SONAR_AUTH_TOKEN}"  
                }
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
