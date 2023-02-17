
# Configure AWS VPC with EC2 instance

In this project we will create VPC and deploy  different resources within a specific region. We will attach internet gateway to VPC and create public and private subnets and create route table and routes are configured to allow traffic to internet. Security group are created to allow specific traffic  for accessing the resources.EC2 instance created and installed apache software which is accessible from outside world. Created IAM role and assigned specific policies  and attached to EC2 to access the S3 buckets from the instance.


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.54.0 |



## Resources

| Name | Type |
|------|------|
| [aws_iam_instance_profile.dev-profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_policy.dev-s3-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy_attachment.dev-attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_role.dev-role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_instance.dev-ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_internet_gateway.dev-igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_route_table.dev-public-rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.dev-rta-web-subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.dev-sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.app-subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.db-subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.web-subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.dev-vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

Before running the code , change the input variable values related to key-name and privatekey-path to your key pair details.

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | enter the region | `string` | `"us-east-1"` | no |
| <a name="input_key-name"></a> [key-name](#input\_key-name) | enter the private key name related to ec2 machine | `string` | `"ec2-key"` | no |
| <a name="input_privatekey-path"></a> [privatekey-path](#input\_privatekey-path) | enter the private key path with name  utilizing for ec2 machine | `string` | `"./ec2-key.pem"` | no |
| <a name="input_user-name"></a> [user-name](#input\_user-name) | enter the user name related to ec2 machine | `string` | `"ec2-user"` | no |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | enter the cidr range for vpc | `string` | `"10.0.0.0/16"` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | enter the vpc name | `string` | `"dev_vpc"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_subnet"></a> [app\_subnet](#output\_app\_subnet) | App Subnet |
| <a name="output_db_subnet"></a> [db\_subnet](#output\_db\_subnet) | DB Subnet |
| <a name="output_ec2_public_ip"></a> [ec2\_public\_ip](#output\_ec2\_public\_ip) | Public IP |
| <a name="output_public_dns"></a> [public\_dns](#output\_public\_dns) | Public DNS|
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | Virtual Private Cloud |
| <a name="output_web_subnet"></a> [web\_subnet](#output\_web\_subnet) | Web Subnet |

## Deployment

 - Terraform should be installed
 - Connectivity should be established between AWS and Terraform
 - Key Pair should be created
 - Update Key name and path related to Key name within variables.tf file
 - Below terraform commands need to run for deployment
   - terraform init
   - terraform fmt
   - terraform validate
   - terraform plan
   - terraform apply -auto-approve
 - Once deployement is completed, take public ip of ec2 instance and paste in     browser to access test page of apache. 
 - Login into ec2 instance and run aws s3 ls command to view list of buckets 
 - Once validation completed, destroy the resources using below command
   - terraform destroy -auto-approve

