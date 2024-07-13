# Date and Time
Code and Documented created on July 13th 2024, Saturday

# Splunk on Linux

This repository contains code and instructions for deploying Splunk on Linux using Terraform on AWS platform.

## Prerequisites

Before getting started, make sure you have the following:

- Linux machine with Terraform installed
- Splunk Enterprise license
- AWS account credentials

## Deployment Steps

0. Configure AWS credentials with `aws configure` command.
   - Replace `<ACCESS KEY>` & `<SECRET KEY>` with your AWS credentials. 
1. Clone this repository to your local machine.
2. Navigate to the `SplunkOnLinux` directory.
3. Update the `variables.tf` file with your desired configuration.
4. Run `terraform init` to initialize the Terraform environment.
5. Run `terraform plan` to review the planned infrastructure changes.
6. Run `terraform apply` to deploy Splunk on Linux.
7. Once the deployment is complete, you can access Splunk by navigating to the public IP address of the EC2 instance in your web browser with `port 8000`.


## Contributing

Contributions are welcome! If you find any bugs or have suggestions for improvements, please open an issue or submit a pull request.
