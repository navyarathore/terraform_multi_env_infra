# Terraform Multi-Environment Infrastructure With State Locking 

This repository contains Terraform configuration for deploying and managing multi-environment AWS infrastructure with state locking. The project uses DynamoDB for state locking to prevent conflicts during team collaboration. It supports development, testing, and production environments with a modular approach, creating a complete networking stack (VPC, subnets, gateways) and EC2 instances.

## Project Structure

The project follows a well-organized, modular structure that enables clean separation of concerns and promotes code reusability across environments:

```
terraform_multi_env_infra/
├── README.md                # Project documentation
│
├── backend_config/          # S3 backend configuration for Terraform state
│   ├── main.tf              # Defines S3 bucket and DynamoDB table for state management
│   ├── output.tf            # Outputs for backend resources
│   ├── terraform.tfstate    # Local state for the backend itself
│   └── variable.tf          # Variables for backend configuration
│
├── environments/            # Environment-specific configurations
│   ├── dev/                 # Development environment
│   │   ├── backend.tf       # Backend configuration for dev environment
│   │   ├── local.tf         # Local values specific to dev environment
│   │   ├── main.tf          # Main configuration with module references
│   │   ├── output.tf        # Output values from the dev deployment
│   │   ├── provider.tf      # AWS provider configuration for dev
│   │   ├── terraform.tfvars # Dev-specific variable values
│   │   └── variable.tf      # Variable definitions for dev environment
│   │
│   ├── test/                # Testing environment (same structure as dev)
│   │   └── ...
│   │
│   └── prod/                # Production environment (same structure as dev)
│       └── ...
│
└── modules/                 # Reusable infrastructure modules
    ├── ec2/                 # EC2 instance configuration
    │   ├── main.tf          # EC2 instance resource definition
    │   ├── output.tf        # Outputs from the EC2 module
    │   └── variable.tf      # Variables used by the EC2 module
    │
    ├── eip/                 # Elastic IP management
    │   └── ...
    │
    ├── igw/                 # Internet Gateway setup
    │   └── ...
    │
    ├── nat/                 # NAT Gateway configuration 
    │   └── ...
    │
    ├── security_group/      # Security Group with ingress/egress rules
    │   └── ...
    │
    ├── subnet/              # Subnet configuration
    │   └── ...
    │
    └── vpc/                 # VPC setup and configuration
        └── ...
```

### Key Architecture Principles

- **Modularity**: Each AWS resource type has its own dedicated module
- **Environment Isolation**: Complete separation between dev, test, and production configurations
- **DRY (Don't Repeat Yourself)**: Common infrastructure patterns are defined once in modules and reused
- **Convention over Configuration**: Consistent file naming and structure across modules and environments

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
- **Security Features**: Server-side encryption (AES256) and public access blocking are configured for the S3 bucket
- **Lock Table Structure**: The DynamoDB table uses a simple schema with a single primary key called "LockID"

### Deploying an Environment

To deploy an environment (e.g., dev, test, or prod):

```bash
cd environments/dev    # or test or prod
terraform init
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

- **EC2**: Provisions EC2 instances with configurable AMI and instance type
- **EIP**: Manages Elastic IPs for NAT gateways
- **IGW**: Sets up Internet Gateways for public internet access
- **NAT**: Configures NAT Gateways for private subnet outbound traffic
- **Security Group**: Manages Security Groups with customizable ingress/egress rules
- **Subnet**: Creates and configures subnets with specific CIDR blocks and availability zones
- **VPC**: Provisions Virtual Private Clouds with configurable CIDR blocks

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

#### State Locking Mechanism

The project employs DynamoDB as a state locking mechanism to ensure safe concurrent operations:

- **Lock Management**: When a Terraform operation starts, it acquires a lock in the DynamoDB table
- **Lock Enforcement**: If another user attempts to run a Terraform command while a lock is held, the operation will be blocked
- **Lock Identification**: Each lock is uniquely identified with a `LockID` primary key in the DynamoDB table
- **Automatic Release**: Locks are automatically released when operations complete or when they time out
- **Conflict Prevention**: This mechanism prevents state file corruption that could occur from concurrent writes
- **Force Unlock**: In case of stuck locks, administrators can use `terraform force-unlock` to manually release them

When working in a team, this state locking ensures that only one team member can make changes to the infrastructure at a time, preventing conflicts and inconsistencies.

## Security Notes

- The project uses environment-specific security groups with tailored rules
- SSH access (port 22) and HTTP access (port 80) are configured by default
- Consider restricting ingress rules to specific IP ranges in production

## Last Updated
May 26, 2025