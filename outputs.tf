output "vpc_id" {
  description = "Virtual Private Cloud"
  value       = aws_vpc.dev-vpc.id
}
output "web_subnet" {
  description = "Web Subnet"
  value       = aws_subnet.web-subnet.id
}
output "app_subnet" {
  description = "App Subnet"
  value       = aws_subnet.app-subnet.id
}
output "db_subnet" {
  description = "DB Subnet"
  value       = aws_subnet.db-subnet.id
}
output "public_dns" {
  description = "Public DNS"
  value       = aws_instance.dev-ec2.public_dns
}
output "ec2_public_ip" {
  description = "Public IP"
  value       = aws_instance.dev-ec2.public_ip
}
