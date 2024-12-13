resource "aws_lambda_function" "example" {
  function_name    = var.lambda_name
  role             = aws_iam_role.lambda_exec.arn
  handler          = var.lambda_handler
  runtime          = var.lambda_runtime
  source_code_hash = filebase64sha256(var.zip_file)
  filename         = var.zip_file
}

resource "aws_iam_role" "lambda_exec" {
  name               = "${var.lambda_name}-execution-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

output "lambda_function_name" {
  value = aws_lambda_function.example.function_name
}
