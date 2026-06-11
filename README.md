
# 🚀 Terraform Basic to Advanced with AWS Provider

> A hands-on Terraform learning repository covering concepts from **basic infrastructure provisioning to advanced AWS automation**, completed during **Day 61 to Day 68** of my DevOps learning journey.

![Terraform](https://img.shields.io/badge/Terraform-IaC-623CE4?style=for-the-badge&logo=terraform)
![AWS](https://img.shields.io/badge/AWS-Cloud-orange?style=for-the-badge&logo=amazonaws)
![GitHub](https://img.shields.io/badge/GitHub-Version_Control-black?style=for-the-badge&logo=github)

---

# 📖 Repository Overview

This repository documents my practical Terraform learning journey focused on provisioning and managing AWS infrastructure using Infrastructure as Code (IaC).

The project progresses from Terraform fundamentals to advanced concepts including:

- AWS Provider configuration
- Resource provisioning
- Variables and Outputs
- Data Sources and Locals
- Modules
- Remote State Management
- Multi-Environment Deployments
- Terraform Workspaces
- Dynamic Blocks
- Lifecycle Management
- EKS Cluster Deployment
- Helm Integration
- State Locking with DynamoDB
- Infrastructure Automation

The primary cloud provider used throughout the repository is **Amazon Web Services (AWS)**.

---

# 🎯 Learning Journey Summary (Day 61 – Day 68)

| Day | Topic | What I Learned | Why It Is Used | Real-World Use Cases |
|------|--------|----------------|----------------|----------------------|
| Day 61 | Terraform Basics | Providers, EC2, S3, Terraform workflow | Foundation of Infrastructure as Code | Launching cloud infrastructure automatically |
| Day 62 | AWS Networking | VPC, Subnets, Route Tables, Internet Gateway, Security Groups | Network isolation and connectivity | Enterprise cloud network architecture |
| Day 63 | Variables & Data Sources | Variables, Outputs, Locals, tfvars, Data Sources | Reusable and configurable infrastructure | Managing multiple environments |
| Day 64 | Terraform State | State files, state recovery, troubleshooting | Tracks infrastructure changes | Team-based infrastructure management |
| Day 65 | Modules & Backends | Custom modules, backend configuration, remote state | Reusable and scalable infrastructure | Organization-wide Terraform standards |
| Day 66 | Kubernetes on AWS (EKS) | EKS, Node Groups, Helm deployments | Container orchestration | Production Kubernetes platforms |
| Day 67 | Capstone Project | Multi-environment infrastructure, reusable modules | End-to-end project implementation | Dev, Staging, Production deployments |
| Day 68 | Infrastructure Automation | EC2 automation, SSH key management, inventory generation | Automated provisioning workflows | DevOps automation pipelines |

---

# 🛠 Technologies & Tools Used

| Tool/Service | Purpose | Why Used |
|--------------|----------|----------|
| Terraform | Infrastructure as Code | Automates cloud provisioning |
| AWS Provider | AWS resource management | Creates and manages AWS resources |
| Amazon EC2 | Virtual servers | Application hosting |
| Amazon VPC | Network isolation | Secure networking |
| Amazon S3 | Object storage | State storage and storage services |
| DynamoDB | NoSQL database | Terraform state locking |
| Amazon EKS | Managed Kubernetes | Container orchestration |
| Helm | Kubernetes package manager | Deploying applications to EKS |
| Git | Version Control | Track infrastructure changes |
| GitHub | Source Code Management | Collaboration and repository hosting |
| AWS CLI | AWS authentication and interaction | Terraform authentication |
| Terraform Workspaces | Environment separation | Multi-environment deployments |

---

# 📚 Terraform Concepts Covered

| Concept | Description | Why Used | Example Use Case |
|----------|-------------|-----------|------------------|
| Providers | Connect Terraform with cloud platforms | Resource management | AWS Provider |
| Resources | Infrastructure components | Create cloud resources | EC2, VPC, S3 |
| Variables | Dynamic inputs | Reusability | Different environments |
| Outputs | Export resource values | Inter-module communication | EC2 Public IP |
| Data Sources | Read existing infrastructure | Avoid duplication | Latest AMI lookup |
| Locals | Store reusable values | Cleaner code | Common tags |
| Functions | Built-in Terraform operations | Dynamic values | String manipulation |
| Modules | Reusable Terraform code | Scalability | VPC Module |
| State Management | Infrastructure tracking | Drift detection | terraform.tfstate |
| Remote Backend | Centralized state storage | Team collaboration | S3 Backend |
| DynamoDB Locking | State locking | Prevent corruption | Team deployments |
| Count | Create multiple resources | Scalability | Multiple EC2 instances |
| for_each | Resource iteration | Dynamic provisioning | Multiple users/resources |
| Conditional Expressions | Decision making | Environment-based logic | Production-specific resources |
| Dynamic Blocks | Dynamic nested configuration | Reduce code duplication | Security Group rules |
| Lifecycle Rules | Resource behavior control | Safe deployments | create_before_destroy |
| Dependencies | Resource ordering | Correct provisioning | VPC before Subnet |
| Workspaces | Multiple environments | Environment isolation | dev/staging/prod |
| Import Blocks | Manage existing infrastructure | Migration to Terraform | Existing EC2 import |
| Moved Blocks | Resource refactoring | Preserve state | Module restructuring |
| Removed Blocks | Resource cleanup | State management | Infrastructure deprecation |
| Validation Rules | Input validation | Error prevention | Variable validation |
| Terraform Tests | Infrastructure testing | Reliability | Automated validation |
| EKS Infrastructure | Kubernetes platform | Container orchestration | Production clusters |
| Helm Provider | Kubernetes package deployment | Application deployment | NGINX deployment |

---

# ☁️ AWS Resources Used

| AWS Resource | Purpose | Terraform Resource Name | Real-World Example |
|--------------|----------|------------------------|-------------------|
| EC2 Instance | Compute service | `aws_instance` | Application server |
| S3 Bucket | Object storage | `aws_s3_bucket` | Terraform state storage |
| VPC | Network isolation | `aws_vpc` | Enterprise cloud network |
| Subnet | Network segmentation | `aws_subnet` | Public/Private subnets |
| Internet Gateway | Internet access | `aws_internet_gateway` | Public-facing applications |
| Egress Only Internet Gateway | IPv6 outbound access | `aws_egress_only_internet_gateway` | Secure outbound connectivity |
| Route Table | Network routing | `aws_route_table` | Traffic management |
| Route Association | Route mapping | `aws_route_table_association` | Subnet routing |
| Security Group | Firewall rules | `aws_security_group` | Secure application access |
| Security Group Rules | Traffic filtering | `aws_vpc_security_group_ingress_rule` | Port access control |
| Key Pair | SSH authentication | `aws_key_pair` | EC2 access |
| DynamoDB Table | State locking | `aws_dynamodb_table` | Terraform backend locking |
| EKS Cluster | Kubernetes control plane | EKS Module | Container orchestration |
| EKS Node Group | Worker nodes | EKS Module | Kubernetes workloads |

---

# 📂 Project Structure

```text
terraform-basic-to-advanced-aws-provider/
│
├── day61/
│   └── terraform-basics/
│
├── day62/
│   └── terraform-aws-infra/
│
├── day63/
│   └── terraform-aws-infra/
│
├── day64/
│   └── terraform-aws-infra/
│
├── day65/
│   ├── terraform-modules/
│   └── terraform-aws-infra/
│
├── day66/
│   └── terraform-eks/
│
├── day67/
│   └── terraweek-capstone/
│
├── day68/
│   └── terraform/
│
├── remote-backends/
│
├── terraform-aws-multi-environment/
│
├── terraform-for-advanced/
│
└── terraform-for-devops/
```

## Folder Breakdown

### Day 61
Terraform fundamentals, AWS provider setup, EC2 and S3 creation.

### Day 62
AWS networking concepts including VPC, Subnets, Routing, and Security Groups.

### Day 63
Variables, Outputs, Locals, Data Sources, and tfvars usage.

### Day 64
Terraform state management and troubleshooting.

### Day 65
Custom Terraform modules, backend setup, reusable infrastructure.

### Day 66
Amazon EKS cluster deployment and Kubernetes integration.

### Day 67
Capstone project implementing modular and multi-environment infrastructure.

### Day 68
Infrastructure automation and EC2 provisioning workflows.

### Remote Backends
S3 backend and DynamoDB locking configuration.

### Multi-Environment Project
Workspace-based infrastructure deployment for dev, staging, and production.

### Terraform Advanced
Advanced Terraform features such as import, moved blocks, lifecycle management, and testing.

---

# 🚀 How to Use This Repository

## Prerequisites

- Terraform Installed
- AWS Account
- AWS CLI Configured
- Git Installed

---

## Clone Repository

```bash
git clone https://github.com/sumit9165/terraform-basic-to-advanced-aws-provider.git

cd terraform-basic-to-advanced-aws-provider
```

---

## Initialize Terraform

```bash
terraform init
```

---

## Validate Configuration

```bash
terraform validate
```

---

## Create Execution Plan

```bash
terraform plan
```

---

## Apply Infrastructure

```bash
terraform apply
```

---

## Destroy Infrastructure

```bash
terraform destroy
```

---

# 🎓 Key Learnings

| Category | Key Learning |
|-----------|-------------|
| Infrastructure as Code | Automate cloud infrastructure consistently |
| AWS Automation | Provision resources using code |
| State Management | Track and manage infrastructure lifecycle |
| Modules | Build reusable infrastructure components |
| Environment Management | Manage dev/staging/prod efficiently |
| Kubernetes Automation | Deploy EKS clusters with Terraform |
| Backend Management | Centralized state storage and locking |
| DevOps Practices | Version-controlled infrastructure |

---

# ✅ Best Practices Followed

| Best Practice | Why Important |
|--------------|--------------|
| Use Variables | Avoid hardcoded values |
| Modular Design | Improve reusability |
| Remote State Storage | Enable team collaboration |
| State Locking | Prevent state corruption |
| Version Control | Track infrastructure changes |
| Resource Tagging | Better AWS governance |
| Environment Separation | Safer deployments |
| Output Management | Easier integration |
| Validation Rules | Prevent invalid configurations |
| Reusable Modules | Faster development |

---

# 📊 Skills Gained

| Skill | Beginner | Intermediate | Advanced |
|---------|:--------:|:------------:|:--------:|
| Terraform Fundamentals | ✅ | ✅ | |
| AWS Provider | ✅ | ✅ | |
| Variables & Outputs | | ✅ | |
| Data Sources & Locals | | ✅ | |
| State Management | | ✅ | |
| Modules | | ✅ | ✅ |
| Remote Backend | | ✅ | ✅ |
| Workspaces | | ✅ | ✅ |
| Dynamic Blocks | | | ✅ |
| Lifecycle Rules | | | ✅ |
| Terraform Testing | | | ✅ |
| EKS Deployment | | | ✅ |
| Multi-Environment Infrastructure | | | ✅ |
| Infrastructure Automation | | | ✅ |

---

# 📝 Resume-Friendly Project Description

### Resume Description (2 Lines)

Designed and deployed AWS infrastructure using Terraform, progressing from basic resource provisioning to advanced concepts including modules, remote state management, EKS, and multi-environment deployments.

Implemented reusable Infrastructure as Code (IaC) solutions leveraging AWS services such as EC2, VPC, S3, DynamoDB, Security Groups, and Kubernetes (EKS).

---

# 💼 LinkedIn Project Description

Built a comprehensive Terraform learning project covering AWS infrastructure provisioning from beginner to advanced levels.

Implemented AWS resources including EC2, VPC, Security Groups, S3, DynamoDB, and EKS using Infrastructure as Code principles.

Developed reusable Terraform modules, configured remote state storage with S3 and DynamoDB locking, and managed multi-environment deployments using workspaces.

Integrated Kubernetes deployments through Amazon EKS and Helm.

Applied DevOps best practices including modular architecture, validation rules, lifecycle management, infrastructure testing, and version control.

---

# 🌐 Portfolio Project Summary

This repository showcases a complete Terraform learning journey focused on AWS cloud automation and Infrastructure as Code. The project demonstrates the practical implementation of Terraform fundamentals, networking, modular architecture, state management, Kubernetes orchestration with EKS, remote backends, and multi-environment deployments. It reflects real-world DevOps practices used in enterprise cloud environments and highlights proficiency in building scalable, reusable, and production-ready AWS infrastructure.

---

## ⭐ If you found this repository useful, consider giving it a star!

----

