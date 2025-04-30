resource "aws_s3_bucket" "s3_bucket" {
  bucket = "super-puper-bucket-test-9"
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "super-puper-bucket-test-9-1"
}

resource "aws_iam_role" "test_role" {
  name = "test_role_for_pipeline_9"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "tag-value"
  }
}