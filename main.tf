provider "aws" {
  region = "eu-west-1"
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "assume_github_code_guru_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Federated"
      identifiers = ["arn:aws:iam::194104352727:oidc-provider/token.actions.githubusercontent.com"]
    }

    actions = ["sts:AssumeRoleWithWebIdentity"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda_codeguru"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role" "github_code_guru_role" {
  name               = "CodeGuruSecurityGitHubAccessRole"
  description = "Role for access codeguru-security from github"
  max_session_duration = 3600
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  managed_policy_arns=["arn:aws:iam::aws:policy/AmazonCodeGuruSecurityScanAccess"]
}

data "archive_file" "lambda" {
  type        = "zip"
  output_path = "lambda_function_payload.zip"
  source_dir = "users"
}

resource "aws_lambda_function" "codeguru-test" {
  filename      = "lambda_function_payload.zip"
  function_name = "codeguru-test"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "users.handler"

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = "python3.9"
}

resource "aws_lambda_function_url" "codeguru-test_url" {
  function_name = aws_lambda_function.codeguru-test.arn
  authorization_type = "NONE"
}