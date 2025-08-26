# -------------------------
# ALB Outputs
# -------------------------

output "alb_id" {
  description = "The ID of the Application Load Balancer"
  value       = aws_lb.jai_alb.id
}

output "alb_arn" {
  description = "The ARN of the Application Load Balancer"
  value       = aws_lb.jai_alb.arn
}

output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  value       = aws_lb.jai_alb.dns_name
}

output "alb_zone_id" {
  description = "The canonical hosted zone ID of the ALB (useful for Route53 alias)"
  value       = aws_lb.jai_alb.zone_id
}

# -------------------------
# Target Group Outputs
# -------------------------

output "target_group_arn" {
  description = "The ARN of the Target Group"
  value       = aws_lb_target_group.jai_terra_TG.arn
}

output "target_group_name" {
  description = "The name of the Target Group"
  value       = aws_lb_target_group.jai_terra_TG.name
}

# -------------------------
# Listener Outputs
# -------------------------

output "http_listener_arn" {
  description = "The ARN of the HTTP Listener"
  value       = aws_lb_listener.http_listener.arn
}
