resource "aws_launch_template" "example" {
  name          = var.launch_template_name
  image_id      = var.ami_id
  instance_type = var.instance_type
}

resource "aws_autoscaling_group" "example" {
  launch_template {
    id      = aws_launch_template.example.id
    version = "$Latest"
  }
  vpc_zone_identifier = [var.subnet_id]
  min_size            = var.min_size
  max_size            = var.max_size
  desired_capacity    = var.desired_capacity
}

output "asg_name" {
  value = aws_autoscaling_group.example.name
}
