# Terraform Cloud Infrastructure


This project serves as a sophisticated blueprint illustrating a multi-layered approach to cloud infrastructure deployment using the Terraform framework. The project is organized into 2 distinct subprojects and based principles are on Terraform layering.

# Architecture 

The infrastructure is architected to provide a resilient, scalable, and secure environment for application deployment, featuring:

**Amazon ECS Fargate:** Utilized for containerized application deployment, ensuring a serverless operational model with the task count statically set to 1 for simplicity and cost-effectiveness. ECS tasks are deployed within private subnets to enhance security.

**Amazon VPC:** Configured with both public and private subnets. The VPC design encapsulates the best practices for network security and segmentation, ensuring a secure communication channel for the deployed services.

**Application Load Balancer (ALB):** Positioned within the public subnets, acting as the entry point for inbound traffic. The ALB efficiently distributes incoming traffic across ECS tasks, providing high availability and fault tolerance.

**NAT Gateway:** Deployed in the public subnet to enable outbound internet access for resources within the private subnets, facilitating necessary updates and patches without exposing these resources directly to the internet.

**Security Groups:** Meticulously crafted to enforce strict access controls, ensuring that only the required communication paths are permitted, thereby bolstering the overall security posture of the infrastructure.

**RDS MySQL:** Provisioned within the private subnets to house application data, leveraging the inherent security and scalability features of AWS RDS. The private subnet deployment further secures the database from direct external access.

# Project structure


1. **modules**
2. **environments**

## ASCII representation of the project structure

aws/
├── project_abc/
│ ├── modules/
│ │ ├── vpc/
│ │ ├── ecs/
│ │ ├── rds/
│ │ ├── sec_groups/
│ │ └── aws_secret_manager/
│ └── environments/
│ ├── dev/
│ │ ├── application/
│ │ ├── db/
│ │ ├── network/
│ │ └── secrets/
│ └── prod/
│ ├── application/
│ ├── db/
│ ├── network/
│ └── secrets/

## Modules

Modules directory contains 5 different component that are used for this project: vpc, ecs, rds, sec_groups and aws_secret_manager

## Environments

Environment directory represent 2 environments dev and prod. Each of environment contain separated layer for Terraform deployment which is structured into: application, db, network and secrets. That means that each layer have their own tfstate file and that they are working independetly.

## Getting Started

1. **Clone**: Clone this repository to your local machine.
2. **Terraform Credentials**: Export Terraform AWS Access and Secret keys to run the code

## Create an S3 Bucket:

If you haven't already, create an S3 bucket in AWS to store your Terraform state files. Ensure that the bucket is in the desired eu-west-1 region and has versioning enabled for better state file management.

- Configure the Terraform Backend:

  In your Terraform configuration file (e.g. environment/dev/networking/backend.tf or within the terraform block of your main configuration), replace [SET_S3_BUCKET_FOR_TF_STATE] with the name of the S3 bucket you created. This needs to be done for all layers in environment because they do not share TF_STATE fo;e/

3. **Run code from Network layer first**: go to dev/ or prod/ directory and apply the code from Network layer first. 

  ### 3.1  Network needs to be setup first!
  
  eg. cd project_abc/aws/environment/dev/networking

  make sure to export Terraform credentials first

 - terraform init
 - terraform plan
 - terraform apply
 
  ### 3.2  Apply the secrets
  
  eg. cd project_abc/aws/environment/dev/secrets

  make sure to export Terraform credentials first

 - terraform init
 - terraform plan
 - terraform apply

  ### 3.3  Create DB RDS MySQL
  
  eg. cd project_abc/aws/environment/dev/db

  make sure to export Terraform credentials first

 - terraform init
 - terraform plan
 - terraform apply

  ### 3.4  Create ECS Fargate
  
  eg. cd project_abc/aws/environment/dev/application

  make sure to export Terraform credentials first

 - terraform init
 - terraform plan
 - terraform apply
