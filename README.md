# Terraform Multi-Environment Repo Template

Production-ready Terraform repository template designed for real-world cloud projects using a **modular** and **multi-environment** architecture.

This template helps teams manage infrastructure safely across **dev / staging / prod** while keeping code reusable, clean, and scalable.

---

## 📁 Repository Structure

```text
terraform-multi-env-template/
│
├── environments/
│   ├── dev/
│   │   ├── backend.tf
│   │   ├── providers.tf
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── terraform.tfvars
│   │
│   ├── staging/
│   │   ├── backend.tf
│   │   ├── providers.tf
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── terraform.tfvars
│   │
│   └── prod/
│       ├── backend.tf
│       ├── providers.tf
│       ├── main.tf
│       ├── variables.tf
│       ├── terraform.tfvars
│
├── modules/
│   ├── network/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │
│   ├── compute/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │
│   ├── storage/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│
├── globals/
│   ├── variables.tf
│   └── locals.tf
│
├── scripts/
│   ├── init.sh
│   ├── plan.sh
│   └── apply.sh
│
├── .gitignore
├── README.md
└── versions.tf
```

---

## 🧠 Design Philosophy

This repository follows clear architectural principles:

- ❌ **No resources in root**
- 🌍 **Each environment is fully isolated**
- 🧩 **Modules are reusable and versioned**
- 🔐 **Remote state per environment**
- ☁️ **Cloud-agnostic design**

Suitable for:
- Azure
- AWS
- Multi-Cloud architectures

---

## 🔧 Environment → Module Example

### `environments/dev/main.tf`
```hcl
module "network" {
  source = "../../modules/network"

  env_name      = "dev"
  address_space = "10.0.0.0/16"
}
```

### `modules/network/variables.tf`
```hcl
variable "env_name" {
  type = string
}

variable "address_space" {
  type = string
}
```

---

## ☁️ Remote Backend Example (Azure)

### `environments/dev/backend.tf`
```hcl
terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstateaccount"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}
```

Each environment uses its **own state file** to ensure safety and isolation.

---

## 📌 Helper Scripts

Scripts are optional but recommended for consistency.

### `scripts/init.sh`
```bash
#!/bin/bash
cd environments/$1 || exit
terraform init
```

### Usage
```bash
./scripts/init.sh dev
```

Similar scripts can be used for `plan` and `apply`.

---

## 🧪 Best Practices Included

- Remote state per environment
- Clear naming conventions
- Mandatory tagging / labeling
- `terraform fmt` & `terraform validate`
- CI/CD ready structure
- Safe promotion from dev → staging → prod

---

## 🚀 How to Use

```bash
cd environments/dev
terraform init
terraform plan
terraform apply
```

Repeat the same workflow for `staging` and `prod`.

---

## 📝 Repository Description (GitHub)

> Production-ready Terraform multi-environment template using a modular architecture.  
> Designed for Azure, AWS, and Multi-Cloud deployments.

---

## 🤝 Contributions & Extensions

This template can be extended with:
- CI/CD pipelines (GitHub Actions / Azure DevOps)
- Cloud-specific branches (Azure / AWS)
- Advanced modules (Networking, Compute, Security, Kubernetes)
- Architecture diagrams

---

## 📌 Author
Emad Adel

Built for real-world cloud and DevOps projects.  
Feel free to fork, use, and adapt for your organization.

Happy Terraforming 🚀
