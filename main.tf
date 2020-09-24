resource "aws_ecr_repository" "repo" {
  name                 = var.name
  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  encryption_configuration {
    encryption_type = var.encryption_type
    kms_key         = var.kms_key
  }

  tags = var.tags
}

data "aws_caller_identity" "current" {
}

data "aws_iam_policy_document" "repo" {
  statement {
    actions = [
      "ecr:BatchCheckLayerAvailability",
      "ecr:BatchGetImage",
      "ecr:DescribeImages",
      "ecr:DescribeRepositories",
      "ecr:GetAuthorizationToken",
      "ecr:GetDownloadUrlForLayer",
      "ecr:GetRepositoryPolicy",
      "ecr:ListImages",
    ]
    principals {
      identifiers = flatten([
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root",
        var.cross_account_users,
      ])
      type = "AWS"
    }
    sid = "AllowCrossAccountAccess"
  }
}

resource "aws_ecr_repository_policy" "repo" {
  policy     = data.aws_iam_policy_document.repo.json
  repository = aws_ecr_repository.repo.name
}

resource "aws_ecr_lifecycle_policy" "repo" {
  policy     = file("${path.module}/lifecycle-policy.json")
  repository = aws_ecr_repository.repo.name
}

