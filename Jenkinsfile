pipeline {
    agent any

    stages {
        stage ('Build image') {
            steps {
                sh 'echo "Executando docker build'
            }

        }

         stage ('Push Docker image') {
            steps {
                sh 'echo "Executando push '
            }

        }

         stage ('Deploy no Kube') {
            steps {
                sh 'echo "Executando deploy no kube'
            }

        }
    }
}