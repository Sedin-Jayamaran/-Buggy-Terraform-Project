resource "aws_ecs_service" "jai_service" {
  name            = "jai-ecs-service"
  cluster         = "JAI-TERRA-CLUSTER"   
  task_definition = aws_ecs_task_definition.JAI-TERRA-TD-web.arn          
  desired_count   = 1
  launch_type     = "EC2"

  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent         = 200

  
  network_configuration {
    subnets         = var.public_subnet  
    security_groups = [var.ecs_security_group_id]                         
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = "buggy-web-terra"      
    container_port   = 3000       
  }
}
