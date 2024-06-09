pipeline {
    agent none
    
    stages {
        stage('Build Docker Image') {
            agent {
                label 'Build_agent'
            }
            steps {
                sh 'docker rmi -f ${DOCKER_IMAGE_NAME}'
                sh "docker build -t ${DOCKER_IMAGE_NAME} ." 
            }
        }
        stage('Push Docker Image') {
            agent {
                label 'Build_agent'
            }
            steps {
                sh "docker push ${DOCKER_IMAGE_NAME}"
        
            }
        }
        
         stage('Push into k8s') {
            agent {
                label 'Deploy_agent'
            }
            steps {
                input(message: 'Please confirm Deploy Prod', ok: 'Proceed?')
                script {
                    withCredentials([file(credentialsId: 'put_here_creds', variable: 'GOOGLE_APPLICATION_CREDENTIALS')]) {
                        sh """
                            gcloud auth activate-service-account --key-file=${GOOGLE_APPLICATION_CREDENTIALS}
                            gcloud container clusters get-credentials ${E_CLUSTER_NAME} \
                                --region=${E_REGION_NAME} --project=${E_PROJECT_NAME}
                            kubectl get namespaces
                            kubectl apply -f k8s/mybot.yaml
                            kubectl apply -f k8s/deployment-v1.yaml
                            kubectl apply -f k8s/deployment-v2.yaml
                            kubectl apply -f k8s/service-v1.yaml
                            kubectl apply -f k8s/service-v2.yaml
                            kubectl apply -f k8s/service-allInOne.yaml
                            kubectl apply -f k8s/ingress.yaml
                            kubectl get deployments

                        """
                    }
                }   
                            
            }
         }

    }
}


