# CodeStar Connection (top-level resource)
resource "aws_codestarconnections_connection" "example" {
  name          = "example-connection"
  provider_type = "GitHub"
}

# CodePipeline
resource "aws_codepipeline" "codepipeline" {
  name     = "Jai-Buggy-Codepipeline"
  role_arn = aws_iam_role.codepipeline_role.arn

  artifact_store {
    location = var.bucket
    type     = "S3"
  }

  stage {
    name = "Sourcing"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        # use the connection we created above
        ConnectionArn = "arn:aws:codeconnections:ap-south-1:156916773321:connection/f85f8b5c-dcfb-412d-a1b3-6d9064a2cb9c"

        FullRepositoryId = "Sedin-Jayamaran/Code-Pipeline"
        BranchName       = "master"
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]
      version          = "1"

      configuration = {
        ProjectName = var.build
      }
    }
  }
}
