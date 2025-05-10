# Terraform Multi-Environment Infrastructure Project

This project contains a modular Terraform infrastructure setup for managing cloud resources across different environments (dev, test, prod).

This is task 3, a part of my DevOps specialization coursework.

## Project Structure

```
.
├── README.md                   # Project documentation
├── environments/               # Environment-specific configurations
│   ├── dev/                    # Development environment
│   │   ├── local.tf            # Local variables for development
│   │   ├── main.tf             # Main configuration calling modules
│   │   ├── output.tf           # Outputs for development environment
│   │   ├── provider.tf         # AWS provider configuration
│   │   ├── terraform.tfstate   # Terraform state file
│   │   ├── terraform.tfvars    # Variable values for development
│   │   └── variable.tf         # Input variables declaration
│   ├── test/                   # Testing environment
│   │   ├── local.tf            # Local variables for testing
│   │   ├── main.tf             # Main configuration calling modules
│   │   ├── output.tf           # Outputs for test environment
│   │   ├── provider.tf         # AWS provider configuration
│   │   ├── terraform.tfvars    # Variable values for testing
│   │   └── variable.tf         # Input variables declaration
│   └── prod/                   # Production environment
│       ├── local.tf            # Local variables for production
│       ├── main.tf             # Main configuration calling modules
│       ├── output.tf           # Outputs for production environment
│       ├── provider.tf         # AWS provider configuration
│       ├── terraform.tfvars    # Variable values for production
│       └── variable.tf         # Input variables declaration
└── modules/                    # Reusable infrastructure modules
    ├── ec2/                    # EC2 instance configuration
    │   ├── main.tf             # Main EC2 resource definitions
    │   ├── output.tf           # EC2 outputs
    │   └── variable.tf         # EC2 input variables
    ├── eip/                    # Elastic IP configuration
    │   ├── main.tf             # Main EIP resource definitions
    │   ├── output.tf           # EIP outputs
    │   └── variable.tf         # EIP input variables
    ├── igw/                    # Internet Gateway configuration
    │   ├── main.tf             # Main IGW resource definitions
    │   ├── output.tf           # IGW outputs
    │   └── variables.tf        # IGW input variables
    ├── nat/                    # NAT Gateway configuration
    │   ├── main.tf             # Main NAT resource definitions
    │   ├── output.tf           # NAT outputs
    │   └── variables.tf        # NAT input variables
    ├── s3/                     # S3 bucket configuration
    │   ├── main.tf             # Main S3 resource definitions
    │   ├── output.tf           # S3 outputs
    │   └── variable.tf         # S3 input variables
    ├── security_group/         # Security group configuration
    │   ├── main.tf             # Main SG resource definitions
    │   ├── output.tf           # SG outputs
    │   └── variables.tf        # SG input variables
    ├── subnet/                 # Subnet configuration
    │   ├── main.tf             # Main subnet resource definitions
    │   ├── output.tf           # Subnet outputs
    │   └── variables.tf        # Subnet input variables
    └── vpc/                    # VPC configuration
        ├── main.tf             # Main VPC resource definitions
        ├── output.tf           # VPC outputs
        └── variables.tf        # VPC input variables
```

## Modules

The project is organized into reusable modules:

- **VPC**: Network isolation for your resources
- **Subnet**: Network segmentation within the VPC
- **Internet Gateway (IGW)**: Connects VPC to the internet
- **NAT Gateway**: Allows private subnet resources to access internet
- **Security Group**: Controls inbound and outbound traffic
- **EC2**: Virtual server instances
- **Elastic IP (EIP)**: Fixed public IP addresses
- **S3**: Object storage service

## Environments

The infrastructure is deployed to three separate environments:

- **Dev**: For development and testing during the build phase
- **Test**: For QA and integration testing
- **Prod**: Production environment for live workloads

Each environment directory contains:
- `main.tf`: Main configuration file that calls modules
- `variable.tf`: Input variables for the environment
- `output.tf`: Output values after deployment
- `provider.tf`: Provider configuration
- `local.tf`: Local variables
- `terraform.tfvars`: Variable values specific to the environment

## Getting Started

### Prerequisites

- Terraform installed (v1.0.0+)
- AWS CLI configured with appropriate credentials

### Deploying to an Environment

1. Navigate to the environment directory:
   ```
   cd environments/dev
   ```

2. Initialize Terraform:
   ```
   terraform init
   ```

3. Review the changes:
   ```
   terraform plan
   ```

4. Apply the changes:
   ```
   terraform apply
   ```

5. When finished, you can destroy the resources:
   ```
   terraform destroy
   ```

## Adding New Resources

To add new resources, create new modules in the `modules/` directory following the established pattern, then reference them from the appropriate environment configuration.


## Best Practices

1. Use remote state storage for team collaboration
2. Keep sensitive data out of version control
3. Use consistent naming conventions
4. Tag all resources appropriately
5. Use workspaces for environment isolation

## Last Updated
May 10, 2025