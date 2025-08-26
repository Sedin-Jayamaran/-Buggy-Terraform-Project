resource "aws_autoscaling_group" "JAI-TERRA-ASG" {
  vpc_zone_identifier = var.public_subnet
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  launch_template {
    id      = aws_launch_template.jai-launch-template.id
    version = "$Latest"
  }
}