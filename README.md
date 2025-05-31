# Automate-the-deployment-of-a-NodeJS-Application-on-AWS-with-Jenkins
To Automate the deployment of a NodeJS Application on AWS Using a Jenkins pipeline

## Repository structure

This repository contains the Node.js application that will be deployed in AWS. Here is a brief description of the overall structure:
  
- **backend:** Contains the code for the backend of the application with the corresponding Dockerfile

- **frontend:** Contains the code for the frontend of the app (Reactjs) with the corresponding Dockerfile

- **infra:** Contains the Terraform code to deploy the infrastructure that will host the application in AWS

- **ecs-deployment:** Contains the Terraform code used to deploy the ECS tasks definitions and services for the app

- **Jenkinsfile:** Contains the CICD pipeline that will be use to automate the provisioning of the various components of the infrastructure and the deployment the application.
