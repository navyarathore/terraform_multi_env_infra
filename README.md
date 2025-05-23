# Terraform Multi-Environment Infrastructure Project

This project contains a modular Terraform infrastructure setup for managing cloud resources across different environments (dev, test, prod).

This is task 3, a part of my DevOps specialization coursework.

## Project Structure

```
.
├── README.md                   
├── environments/               
│   ├── dev/                    
│   │   ├── local.tf            
│   │   ├── main.tf             
│   │   ├── output.tf           
│   │   ├── provider.tf       
│   │   └── variable.tf         
│   ├── test/                   
│   │   ├── local.tf            
│   │   ├── main.tf             
│   │   ├── output.tf           
│   │   ├── provider.tf       
│   │   └── variable.tf         
│   └── prod/                   
│       ├── local.tf            
│       ├── main.tf             
│       ├── output.tf           
│       ├── provider.tf        
│       └── variable.tf         
└── modules/                    
    ├── ec2/                    
    │   ├── main.tf             
    │   ├── output.tf           
    │   └── variable.tf        
    ├── eip/                    
    │   ├── main.tf             
    │   ├── output.tf          
    │   └── variable.tf         
    ├── igw/                    
    │   ├── main.tf             
    │   ├── output.tf           
    │   └── variables.tf        
    ├── nat/                    
    │   ├── main.tf             
    │   ├── output.tf           
    │   └── variables.tf        
    ├── s3/                     
    │   ├── main.tf             
    │   ├── output.tf           
    │   └── variable.tf         
    ├── security_group/         
    │   ├── main.tf             
    │   ├── output.tf          
    │   └── variables.tf        
    ├── subnet/                 
    │   ├── main.tf             
    │   ├── output.tf           
    │   └── variables.tf        
    └── vpc/                    
        ├── main.tf             
        ├── output.tf           
        └── variables.tf        
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