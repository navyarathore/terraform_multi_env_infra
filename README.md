# Terraform Multi-Environment Infrastructure

This repository contains Terraform configuration for deploying and managing multi-environment AWS infrastructure. The project is structured to support development, testing, and production environments with a modular approach.

## Project Structure

```
├── backend_config/       # S3 backend configuration for Terraform state
├── environments/         # Environment-specific configurations
│   ├── dev/              # Development environment
│   ├── test/             # Testing environment
│   └── prod/             # Production environment
└── modules/              # Reusable infrastructure modules
    ├── ec2/              # EC2 instance module
    ├── eip/              # Elastic IP module
    ├── igw/              # Internet Gateway module
    ├── nat/              # NAT Gateway module
    ├── security_group/   # Security Group module
    ├── subnet/           # Subnet module
    └── vpc/              # VPC module
```

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) (v1.0.0+)
- AWS CLI configured with appropriate credentials
- Access to an AWS account with permissions to create resources

## Getting Started

### Backend Configuration

Before deploying the environments, set up the S3 backend for storing Terraform state:

```bash
cd backend_config
terraform init
terraform apply
```

This project uses an S3 bucket for Terraform state storage along with a DynamoDB table for state locking. The backend configuration:

- **S3 Bucket**: Stores the Terraform state files with versioning enabled
- **DynamoDB Table**: Provides state locking to prevent concurrent operations that might corrupt your infrastructure state
- **Security Features**: Server-side encryption and public access blocking are configured for the S3 bucket

### Deploying an Environment

To deploy an environment (e.g., dev, test, or prod):

```bash
cd environments/dev    # or test or prod
terraform init -backend-config=backend.tf
terraform plan
terraform apply
```

## Environment Configuration

Each environment (dev, test, prod) contains:

- `backend.tf` - Backend configuration specific to the environment
- `local.tf` - Local values specific to the environment
- `main.tf` - Main configuration file that includes module references
- `output.tf` - Output definitions
- `provider.tf` - Provider configuration
- `terraform.tfvars` - Environment-specific variable values
- `variable.tf` - Variable definitions

## Modules

The infrastructure is built using the following reusable modules:

- **EC2**: Provisions EC2 instances
- **EIP**: Manages Elastic IPs
- **IGW**: Sets up Internet Gateways
- **NAT**: Configures NAT Gateways
- **Security Group**: Manages Security Groups with ingress/egress rules
- **Subnet**: Creates and configures subnets
- **VPC**: Provisions Virtual Private Clouds

## Customization

Customize each environment by modifying the respective `terraform.tfvars` file. Common customizations include:

- AMI ID
- Instance type
- VPC and subnet CIDR blocks
- Security group rules
- Environment-specific tags

## Maintenance and Operations

### Adding New Resources

To add new resources:

1. Create a new module in the `modules/` directory (if needed)
2. Reference the module in the environment's `main.tf` file
3. Add required variables to the environment's `variable.tf` file
4. Set variable values in the environment's `terraform.tfvars` file

### Updating Existing Resources

To update existing resources:

1. Modify the relevant files in the appropriate environment directory
2. Run `terraform plan` to review changes
3. Apply changes with `terraform apply`

### State Management

The project implements robust state management practices:

- **Remote State**: All environment states are stored in the configured S3 backend
- **State Locking**: DynamoDB is used to prevent concurrent modifications that could lead to state corruption or race conditions
- **Isolation**: Each environment has its own state file configuration in its respective `backend.tf` file

When working in a team, state locking ensures that only one team member can make changes to the infrastructure at a time, preventing conflicts and inconsistencies.

## Security Notes

- The project uses environment-specific security groups with tailored rules
- SSH access (port 22) and HTTP access (port 80) are configured by default
- Consider restricting ingress rules to specific IP ranges in production

## Last Updated
May 26, 2025