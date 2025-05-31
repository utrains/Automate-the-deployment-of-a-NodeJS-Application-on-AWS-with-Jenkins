pipeline {
    agent any

    environment {
        FRONTEND_REPO = "885684264653.dkr.ecr.us-east-2.amazonaws.com/node-frontend-repo"
        BACKEND_REPO = "885684264653.dkr.ecr.us-east-2.amazonaws.com/node-backend-repo"
        AWS_REGION = "us-east-2"
        TAG = "latest"
    }

    stages {
        stage ('Create the infrastructure on AWS'){
            steps {
                sh '''
                cd infra
                terraform init
                terraform apply -auto-approve
                '''
            }
        }

        stage ('Build backend and frontend images to ECR'){
            steps {
                sh '''
                 # Build The Frontend Image from the Dockerfile of the frontend
                echo "Building frontend Docker image from the Dockerfile of the frontend"
                docker build -t $FRONTEND_REPO:$TAG frontend

                # Build The Backend Image from the Dockerfile of the backend
                echo "Building backend Docker image from the Dockerfile of the backend"
                docker build -t $BACKEND_REPO:$TAG backend
                '''
            }
        }

        stage ('Push backend and frontend images to ECR'){
            steps {
                sh '''
                # Push The Frontend Image to the frontend ECR repository
                echo "Pushing frontend Docker image to the frontend ECR repository"
                docker push $FRONTEND_REPO:$TAG 

                # Push The Backend Image to the backend ECR repositor
                echo "Pushing backend Docker image. to the backend ECR repository"
                docker push $BACKEND_REPO:$TAG
                '''
            }
        }

        stage ('Deploying the app to ECS'){
            steps{
                sh '''
                cd ecs-deployment
                terraform init
                terraform apply -auto-approve
                '''
            }
        }

         stage ('Hold Destroy') {
            steps {
                input message: 'Do you really want to destroy the infrastructure?'
            }
        }

        stage ('Destroy Infrastructure') {
            steps {
                sh '''
                cd ecs-deployment
                terraform destroy -auto-approve
                cd ..
                cd infra
                terraform destroy -auto-approve
                '''
            }
        }
    }
}