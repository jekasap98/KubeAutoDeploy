# KubeAutoDeploy
A project for deploying a small application in Kubernetes with automatic infrastructure provisioning using Terraform.

### Infrastructure and CI/CD Pipeline Deployment Guide

This project focuses on automating infrastructure deployment and setting up a CI/CD pipeline for deploying any application. The bot application is derived from a previous project (link provided below) and is used here as the application to be deployed.

#### Tools and Services Used:

- **Terraform:** Used for automating infrastructure deployment on Google Cloud Platform (GCP).
- **Google Cloud Platform (GCP):** Used for hosting and deploying infrastructure.
- **Docker:** Used for building and managing Docker images.
- **Kubernetes (K8s):** Used for managing containerized applications and network load balancing.
- **Jenkins:** Used for automating CI/CD processes.

#### Deployment Steps:

1. **Setting up CI with Jenkins:**
   - Deploy Jenkins using Ansible playbooks provided in this repository. These playbooks automate the installation and configuration of Jenkins on two nodes, whether in cloud or physical machine environments. Ensure to populate your inventory (`hosts` file) with the target nodes and update playbook variables such as `jenkins_url`, `your_secret`, and other environment-specific configurations accordingly.
   - Configure Jenkins to include an agent for building and pushing Docker images. Utilize Docker Hub or a similar Docker registry for storing Docker images securely.
   - Automate the setup of CI workflows by configuring Jenkins jobs to integrate with your version control system (e.g., Git) and orchestrate automated builds, tests, and deployments. Once configured, Jenkins can utilize the Jenkinsfile located in your repository. This Jenkinsfile defines the pipeline for your CI/CD process, allowing Jenkins to automatically execute the defined stages (e.g., build, test, deploy) based on triggers such as code commits or scheduled builds.



2. **Setting up Infrastructure using Terraform:**
   - Create a service account in Google Cloud Console.
   - Grant necessary access permissions (e.g., roles/editor).
   - Authenticate with Google Cloud SDK (`gcloud auth login`) and initialize Terraform (`terraform init`).
   - Plan (`terraform plan`) and apply (`terraform apply`) changes to deploy:
     - **Encrypted bucket for storing Terraform state** (`google_storage_bucket`).
     - **Kubernetes cluster (GKE)** with specifications such as machine type, disk type, and node count (`google_container_cluster`, `google_container_node_pool`).

3. **Installing Helm and NGINX Ingress Controller in Kubernetes:**
   - Install Helm in Kubernetes cluster (`helm install`).
   - Install NGINX Ingress Controller for managing incoming network traffic within the cluster.

4. **Deploying the Telegram Bot Application:**
   - Utilize the CI/CD pipeline to automatically deploy Kubernetes manifests (`kubectl apply`) for your application, including:
     - Bot configuration (`k8s/mybot.yaml`).
     - Deployments (`k8s/deployment-v1.yaml`, `k8s/deployment-v2.yaml`).
     - Services (`k8s/service-v1.yaml`, `k8s/service-v2.yaml`, `k8s/service-allInOne.yaml`).
     - Ingress (`k8s/ingress.yaml`) for load balancing and routing incoming traffic to the application.

5. **Verification and Monitoring:**
   - Ensure deployed resources are functioning correctly by checking Kubernetes deployment status (`kubectl get deployments`).

#### Note:
- Ensure to substitute your specific variables throughout the deployment process, including Google Cloud project name, region, Kubernetes cluster details, and service account credentials.
- All required code and configurations for Terraform, Kubernetes, and CI/CD pipeline are available in this repository.
- For additional information and details, refer to the documentation and resources provided by Google Cloud Platform and Kubernetes.

### Previous Project Link:
[Link to Previous Project](https://github.com/jekasap98/Weather_bot_Telegram)






