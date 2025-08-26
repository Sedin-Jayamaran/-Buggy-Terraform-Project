output "ecs_security_group_id" {
  description = "The ID of the ECS Security Group"
  value       = aws_security_group.ecs_sg.id
}

output "ecs_security_group_arn" {
  description = "The ARN of the ECS Security Group"
  value       = aws_security_group.ecs_sg.arn
}

output "ecs_security_group_name" {
  description = "The Name of the ECS Security Group"
  value       = aws_security_group.ecs_sg.name
}


