# AWS EKS GitOps DevOps Platform, Infrastructure Phase

This repository contains the Infrastructure as Code for provisioning the base AWS environment for an end-to-end GitOps DevOps platform.

## Completed in this phase

The following resources have been provisioned with Terraform:

- AWS VPC
- Public subnets
- Private subnets
- Internet Gateway
- NAT Gateway
- Public and private route tables
- Amazon EKS cluster
- EKS managed node group
- Amazon ECR repository
- EC2 instance for HashiCorp Vault
- KMS resources created by the EKS module for cluster secret encryption
- IAM roles and security groups required for EKS

## Purpose of this repository

This infrastructure serves as the foundation for the full platform, which will later include:

- GitHub Actions for CI
- Argo CD for GitOps continuous deployment
- HashiCorp Vault for secrets management
- Kubernetes microservices running on EKS
- Monitoring with Prometheus and Grafana

## Project structure

```text
terraform/
├── vpc/
├── eks/
├── ecr/
├── iam/
├── vault/
└── backend/
```
**From terraform/ run**
```bash
terraform init
terraform fmt
terraform validate
terraform plan
```

<img width="2940" height="1912" alt="image" src="https://github.com/user-attachments/assets/77cd5591-e20a-47d9-9e22-1b16148a80f4" />

```bash
terraform apply
```

## ✅ Current Status

Infrastructure deployment is **successfully completed and verified**.

- Terraform apply completed without errors
- Kubernetes cluster is reachable
- Worker nodes are running and in **Ready** state

---

## 🏗️ Infrastructure Provisioned

The following AWS resources have been created:

### Networking
- VPC (`10.0.0.0/16`)
- Public subnets (2)
- Private subnets (2)
- Internet Gateway
- NAT Gateway
- Public & private route tables

  <img width="2940" height="1912" alt="image" src="https://github.com/user-attachments/assets/5f7ce4c3-07b4-4959-8d6d-65bd7644c49d" />


### Kubernetes (EKS)
- Amazon EKS cluster (`eks-gitops-cluster`)
- Managed node group (EC2 instances)
- Kubernetes version: `1.29`
- Cluster endpoint (public + private access enabled)

  <img width="2940" height="1912" alt="image" src="https://github.com/user-attachments/assets/75490d8f-42d4-495d-9753-857596a3342a" />


### Security & IAM
- IAM roles and policies for EKS
- Security groups for cluster and nodes
- KMS encryption for Kubernetes secrets
  
<img width="2940" height="1912" alt="image" src="https://github.com/user-attachments/assets/0b11bb8b-4eec-4740-b015-644877c3e0eb" />

### Container Registry
- Amazon ECR repository (for future image storage)

### Secrets Infrastructure
- EC2 instance provisioned for HashiCorp Vault (installation pending)

<img width="2940" height="1760" alt="image" src="https://github.com/user-attachments/assets/35b3aa86-d902-4a7d-93c1-0f84eb40c7c8" />

---

## 📊 Terraform Outputs

<img width="2940" height="1912" alt="image" src="https://github.com/user-attachments/assets/b840c594-33cf-4e0f-8d2d-85a1b3d8f974" />
<img width="2940" height="1912" alt="image" src="https://github.com/user-attachments/assets/0226441c-5bd6-4efb-bdc7-c48e39d5a005" />

## ✅ Phase 2 Progress — Vault Setup

HashiCorp Vault has been installed and verified on the dedicated EC2 instance.

### Completed
- Installed Vault on the Vault EC2 instance
- Started Vault in development mode
- Accessed Vault UI successfully
- Authenticated with the root token
- Verified Vault status from the CLI
- Stored and retrieved test secrets at `secret/myapp`

### Example test secret
- `username = admin`
- `password = supersecret123`

### Verification commands

```bash
export VAULT_ADDR="http://127.0.0.1:8200"
export VAULT_TOKEN="root"
vault status
vault kv get secret/myapp
```
<img width="1470" height="883" alt="Screenshot 2026-03-19 at 11 39 32" src="https://github.com/user-attachments/assets/24d858ef-0ce1-409c-beff-04a3dc169206" />

<img width="1365" height="831" alt="Screenshot 2026-03-19 at 12 04 36" src="https://github.com/user-attachments/assets/9bb252e8-f140-48d1-abe5-0cce37bb742f" />

## 📌 Next Platform Phases
- With the infrastructure now provisioned, the platform can evolve to include:

- GitHub Actions CI pipelines
- ArgoCD GitOps continuous deployment
- Kubernetes application deployments
- Monitoring and observability (Prometheus + Grafana)
- Production ingress and HTTPS routing

These components are implemented in the **platform repository.**


