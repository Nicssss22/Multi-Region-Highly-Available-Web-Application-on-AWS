<img src="https://cdn.prod.website-files.com/677c400686e724409a5a7409/6790ad949cf622dc8dcd9fe4_nextwork-logo-leather.svg" alt="NextWork" width="300" />

# Build Multi-Region Apps on AWS

**Project Link:** [View Project](https://nextwork.ai/projects/bae8d048-ae74-4e56-a899-c7b44cd7b5e7)

**Author:** agustinnico2302@gmail.com  
**Email:** agustinnico2302@gmail.com

---

![Image](https://nextwork.ai/content_gray_heroic_hyena/uploads/bae8d048-ae74-4e56-a899-c7b44cd7b5e7_tdjmyn67)

## Running Independent Services Across AWS Regions

### Expanding the application into a second region

In this step, I’m expanding the workflow and deployment to two AWS Regions, `us-east-1` and `us-west-2`. I will monitor both regional jobs until they finish and compare the two live endpoints. This setup helps reduce latency for application users by serving them from a nearby Region and prepares the application for automatic failover.

### Evidence that each regional service runs independently

The two pages prove regional independence because the application is deploy in a separate geographical area or physical infrastructure which allows each to be failover origins in case downtime happens either origin due to disasters (e.g. earthquake). The architecture is a core definition of high availability and disaster recovery in cloud computing.

### Deploying the first live regional service

In this step, I'm creating the east Region deployment workflow, watch GitHub build and deploy the app, open the first live HTTPS endpoint. This pattern allows me the make the similar workflow to the west region easier.

### Verifying the east region endpoint

The endpoint proves that GitHub Actions successfully deployed the Docker image at the 'us-east-1' region using the GitHub Actions Workflow, which signifies that the several critical layers of the cloud and deployment architecture are working perfectly. Specifically, the OIDC trust relationship has successfully established between AWS and GitHub Actions. Application Containerization was built exactly as intended. Networking such as the security group and application routing are correctly configured. And also proves that the primary deployment node is healthy, otherwise the webpage wouldn't load unless automatic failover to secondary region is configured.

![Image](https://nextwork.ai/content_gray_heroic_hyena/uploads/bae8d048-ae74-4e56-a899-c7b44cd7b5e7_16jgnwmr)

## Automating Container Testing and Delivery

### Building the container workflow

In this step, I'm building a simple Node.js service that is packaged in a Docker container, then using GitHub Actions to test the finished container. These components are important because they prepare the application and deployment pipeline before deploying to AWS.

### What the successful test verified

The workflow successfully verified that the container could run with all required application dependencies installed and confirmed that both HTTP endpoints responded as intended.

![Image](https://nextwork.ai/content_gray_heroic_hyena/uploads/bae8d048-ae74-4e56-a899-c7b44cd7b5e7_ml7zcvew)

## Provisioning AWS Infrastructure with Terraform

### Creating the cloud foundation as code

In this step, I will write IaC code to define theregional AWS foundation such as creating IAM roles and ECR repositories. After that I will store the Terraform outputs as GitHub repository variables.

### Resources that enable the deployment workflow

The Terraform configuration presents several important AWS resources that provide the foundation of the GitHub Actions deployment workflow. These resources allows GitHub Actions to securely authenticate with AWS, push/store Docker images, and deploy using the Amazon ECS Express Mode (Alternative to AWS App Runner).

The GitHub OpenID Connect (OIDC) provider allows GitHub actions to authenticate with AWS without requiring long term access keys to be stored in GitHub, which is a security risk just in case the GitHub account got compromised. Terraform also creates a GitHub Actions IAM role with a trust policy that restricts access to specific repository and main branch. In addition, Terraform also creates two Amazon Elastic Container Registry (ECR) repositories, one in the us-east-1 region and another in us-west-2. And lastly, the Terraform code ensures that the GitHub Actions can assume role and access only needed AWS recources for deployment.

![Image](https://nextwork.ai/content_gray_heroic_hyena/uploads/bae8d048-ae74-4e56-a899-c7b44cd7b5e7_8uoky8e9)

## Establishing Secure GitHub-to-AWS Deployments

### Preparing secure deployment access

In this step, I will create a GitHub repository, record its immutable values, and prepare Terraform in AWS CloudShell. These tools will provide a place to store and manage the project code while allowing me to begin writing the Infrastructure as Code (IaC) configuration.

### Identity restrictions for GitHub access

The identity values used to restrict GitHub's access to AWS are the GitHub numeric Owner ID and GitHub numeric Repository ID. Unlike the owner name and repository name, which can be changed, these numeric IDs remain immutable.

![Image](https://nextwork.ai/content_gray_heroic_hyena/uploads/bae8d048-ae74-4e56-a899-c7b44cd7b5e7_zbep9uc5)

## Comparing Regional Request Performance

### Interpreting median request timing and failover limits

In this project extension, it shows that the 'us-west-2' returns the lowest median response time of 280ms compared to 'us-east-1' of 353ms. It demonstrates that us-west-2 region truly the nearest geographical region than the other one as I tested the response times in the Philippines. Letency observation do not prove health-based failover as this mechanism checks if each endpoints are healthy or not, which not aligned with the purpose of the latency check. Additionally, it also do not provide global traffic routing since this requires a service that receives the user's request and decides which regional endpoint should handle it. So it depends on the architecture and also requires additional service and configuration. Therefore, latency observations/measurements only comare the peroformance or response times of individual regional endpoints.

![Image](https://nextwork.ai/content_gray_heroic_hyena/uploads/bae8d048-ae74-4e56-a899-c7b44cd7b5e7_668yk1o2)

## Defining the Project Goal and Reflecting on Growth

### The multi-region deployment objective

In this project, I will build a Node.js app deployed to multiple AWS region such as us-east-1 and us-west-2 running the same containerized app. The tools will be used are GitHub, Terraform, and Amazon ECS Express Mode, this combination allows automatic deployment in every changes made in the code, deploy the same commit to two independent AWS regions, and automatic failover when the main region goes down. This allows traffic to be routed to the main region without manual intervention in just seconds. At the end of the project, we'll compare response timing between the east and west endpoints

### Tools and concepts developed

The key tools I used includes Terraform, Docker, Amazon ECR, Github Actions, Amazon ECS with Fargate, and browser developers tool. The tool provides me a solid hands-on experience of navigating among them and as well as defining their configuration though the IaC code. I only read and watch about these tools on textbooks and videos, finally I got a chance to get my hands dirty to actually try them how they works.

The concepts I learnt is the OpenID Connect (ODIC) Security Federation which I established a temporary handshake that generates short-lived and automated credentials for each deployment run. Matrix Workflows allows me to understand how a single workflow or GItHub Repository deploy changes to my application to multiple regions at the exact same time. I also learnt the Region deployment independency, wherein I witnessed how physical data centers and separate virtual networks works together and independent with each other to achieve high availability of an appliation.

### Project timeline and challenges

This project took me approximately 6–7 hours to complete since this is my first time building this kind of project. The most challenging part was understanding the extensive IaC code used to provision the infrastructure and configure the appropriate permissions among the services. Additionally, most of the code was new to me, but I tried my best to understand the meaning behind each line of code. So, there is no doubt why it took me so much time to complete the project. Nevertheless, it was worth it since I was able to witness the actual process of how multi-region deployment works.

### Next learning goals

The project provided me with an advanced understanding of how a production-grade DevOps and Cloud Engineering architecture works. It's an honor to get my hands dirty and be exposed to industry-standard practices that professional teams use to keep major applications fast and online, even during regional disasters.

---

*Built with [NextWork](https://nextwork.ai) - [View this project](https://nextwork.ai/projects/bae8d048-ae74-4e56-a899-c7b44cd7b5e7)*
