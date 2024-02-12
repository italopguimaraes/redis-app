pipeline {
    agnet any
    stage('buid da imagem docker'){
        steps{]
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
            sh 'teste-app.sh'
        }
    }
    
}