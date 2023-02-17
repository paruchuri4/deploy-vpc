#Create an IAM Policy

resource "aws_iam_policy" "dev-s3-policy" {
  name        = "S3-Bucket-Access-Policy"
  description = "Provides permission to access S3"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:GetObject*",
          "s3:List*"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}


#Create an IAM Role

resource "aws_iam_role" "dev-role" {
  name = "ec2_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "RoleForEC2"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

# Attach the Policy to the created IAM role

resource "aws_iam_policy_attachment" "dev-attach" {
  name       = "dev-attachment"
  roles      = [aws_iam_role.dev-role.name]
  policy_arn = aws_iam_policy.dev-s3-policy.arn
}

# Create an instance profile using role

resource "aws_iam_instance_profile" "dev-profile" {
  name = "test_profile"
  role = aws_iam_role.dev-role.name
}
