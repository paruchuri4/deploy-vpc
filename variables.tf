variable "aws_region" {
  description = "enter the region"
  default     = "us-east-1"
}
variable "vpc_name" {
  description = "enter the vpc name"
  default     = "dev_vpc"
}
variable "vpc_cidr_block" {
  description = "enter the cidr range for vpc"
  default     = "10.0.0.0/16"
}
variable "user-name" {
  description = "enter the user name related to ec2 machine"
  default     = "ec2-user"
}
variable "key-name" {
  description = "enter the private key name related to ec2 machine"
  default     = "ec2-key" # change the value according to your key pair value
}
variable "privatekey-path" {
  description = "enter the private key path with name  utilizing for ec2 machine"
  default     = "./ec2-key.pem" # change the value according to your key pair location
}