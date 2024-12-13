module "lambda" {
  source           = "./modules/lambda"
  lambda_name      = "my-lambda"
  zip_file         = "lambda_function.zip"
  lambda_handler   = "app.handler"
  lambda_runtime   = "python3.9"
}
