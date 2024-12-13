module "vpc" {
  source             = "./modules/vpc"
  vpc_name           = "my-vpc"
  cidr_block         = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
  availability_zone  = "us-east-1a"
}

module "ec2_autoscaling" {
  source                = "./modules/ec2_autoscaling"
  subnet_id             = module.vpc.subnet_id
  launch_template_name  = "my-launch-template"
  ami_id                = "ami-0abcdef1234567890"
  instance_type         = "t2.micro"
  min_size              = 1
  max_size              = 3
  desired_capacity      = 2
}

module "lambda" {
  source           = "./modules/lambda"
  lambda_name      = "my-lambda"
  zip_file         = "lambda_function.zip"
  lambda_handler   = "app.handler"
  lambda_runtime   = "python3.9"
}
