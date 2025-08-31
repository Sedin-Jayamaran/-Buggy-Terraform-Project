resource "aws_ecs_cluster" "JAI-TERRA-CLUSTER" {
  name = "JAI-TERRA-CLUSTER"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_capacity_provider" "ecs_cp" {
  name = "JAI-TERRA-CLUSTER-cp"
 
  auto_scaling_group_provider {
    auto_scaling_group_arn = aws_autoscaling_group.JAI-TERRA-ASG.arn
 
    managed_scaling {
      status                    = "ENABLED"
      target_capacity           = 75
      minimum_scaling_step_size = 1
      maximum_scaling_step_size = 2
    }
  }
}
 
resource "aws_ecs_cluster_capacity_providers" "cluster_cp" {
  cluster_name       = aws_ecs_cluster.JAI-TERRA-CLUSTER.name
  capacity_providers = [aws_ecs_capacity_provider.ecs_cp.name]
 
  default_capacity_provider_strategy {
    capacity_provider = aws_ecs_capacity_provider.ecs_cp.name
    weight            = 1
    base              = 1
  }
}