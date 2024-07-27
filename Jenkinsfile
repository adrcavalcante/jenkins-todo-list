pipeline {
    agent any

    stages {
        stage ('Build image') {
            steps {
                script {
                    dockerapp = docker.build("adrsantos/jenkins-todo-list:v${env.BUILD_ID}", '-f Dockerfile .')
                }
            }

        }

         stage ('Push Docker image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                     dockerapp.push('latest')
                     dockerapp.push("${env.BUILD_ID}")
                    }
                }
            }

        }

         stage ('Deploy no Kube') {
            steps {
                sh 'echo "Executando deploy no kube"'
            }

        }
    }
}