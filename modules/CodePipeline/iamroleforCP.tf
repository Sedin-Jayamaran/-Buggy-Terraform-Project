resource "aws_iam_role" "codepipeline_role" {
  name = "codepipeline-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "codepipeline.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "codepipeline-role"
  }
}

resource "aws_iam_role_policy" "codepipeline_custom_policy" {
  name = "codepipeline-custom-policy"
  role = aws_iam_role.codepipeline_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:*",             # Access artifact S3 bucket
          "ecs:*",            # Deploy to ECS
          "codebuild:*",      # Trigger CodeBuild
          "codestar-connections:UseConnection"  # GitHub connection
        ]
        Resource = "*"
      }
    ]
  })
}
