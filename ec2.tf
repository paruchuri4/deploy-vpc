
# Create ec2 instance and attach instance profile

resource "aws_instance" "dev-ec2" {

  ami                    = "ami-0dfcb1ef8550277af"
  instance_type          = "t2.micro"
  key_name               = var.key-name #  private key name will be passed thru variable
  subnet_id              = aws_subnet.web-subnet.id
  vpc_security_group_ids = [aws_security_group.dev-sg.id]
  iam_instance_profile   = aws_iam_instance_profile.dev-profile.name

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install httpd -y",
      "sudo systemctl start httpd", # install httpd and start httpd service
    ]
  }
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = var.user-name
    private_key = file("${var.privatekey-path}") #   private key name along with pathh will pass thru variable
    timeout     = "4m"
  }

  tags = {
    Name = "dev-ec2"
  }
}