# d24-web-app
## Task description

### Platform Engineer Evaluation Task   
#### Objective
Design, deploy, and manage a web application on Google Kubernetes Engine (GKE) using Terraform. Implement a GitOps pipeline for continuous deployment, configure monitoring and autoscaling, and ensure the system meets stakeholder requirements, including liveness and readiness probes.
Task Overview
1.	Infrastructure Setup:   
    - Use Terraform to provision a Google Kubernetes Engine (GKE) cluster.   
    - Deploy a web application to the GKE cluster using Kubernetes.   
    - Set up Ingress to expose the application externally.   
Note: You will need to interact with the developer stakeholder to gather all the necessary technical details about the application, including how it is containerized, its resource requirements, and its liveness and readiness probes.   
2.	GitOps Setup:   
    - Implement a GitOps workflow (using FluxCD or a similar tool) to automate the deployment of the application from a Git repository.   
3.	Monitoring and Autoscaling:   
    - Set up monitoring to track the application's performance and ensure operational reliability.   
    - Implement a Horizontal Pod Autoscaler (HPA) to ensure the application can scale based on resource usage (e.g., CPU or memory).   
    - Ensure that the application is configured with appropriate liveness and readiness probes to handle startup and ensure that the application is ready before accepting traffic.   
3.	Stakeholder Interaction:   
    - Ask the developer stakeholder for all relevant details needed to deploy the application (e.g., Docker image, resource requirements, environment variables, liveness, and readiness probes).   
#### Deliverables   
1.	Infrastructure Code:   
    - A GitHub repository containing:   
      - Terraform code to provision the GKE cluster.   
      - Kubernetes manifests for deploying the application, including liveness/readiness probes.
2.	GitOps Pipeline:   
    - A GitOps pipeline that automates the deployment of application changes from a Git repository.   
3.	Monitoring and Alerts:   
    - Provide either a link to the monitoring dashboard or screenshots showing the configured monitoring and alerting rules.   
4.	Scaling Demonstration:   
    - Show evidence of the Horizontal Pod Autoscaler (HPA) in action (e.g., screenshots, logs, or metrics) demonstrating how the application scales under load.   

#### Time Estimate
The task should take approximately 6-8 hours to complete.

#### Evaluation Criteria
- Problem Solving: Your ability to gather and resolve missing technical details (e.g., application configuration, Docker image, probes).
- Automation & Best Practices: Efficient use of Terraform, Kubernetes, GitOps, and monitoring.
- Communication: How effectively you interact with stakeholders to gather key technical and business requirements.
- Monitoring & Resilience: Implementation of monitoring, alerting, autoscaling, and readiness/liveness probes to ensure the application is reliable and scalable.

#### Key Points
- You are not provided with the source code. You must request key information such as the Docker image, environment variables, liveness/readiness probes, and any other configuration details from the developer stakeholder.
- The ability to gather and use the correct information to deploy the application is part of the assessment.   

This task tests your ability to proactively design and deploy infrastructure, solve real-world operational challenges, and collaborate effectively with stakeholders to gather crucial application details.
