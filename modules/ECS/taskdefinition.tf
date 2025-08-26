data "template_file" "taskdef" {
  template = file("${path.module}/taskdef.json.tpl")

  vars = {
    image_url        = var.image_url
    mysql_database   = var.mysql_database
    mysql_password   = var.mysql_password
    mysql_port       = var.mysql_port
    rails_env        = var.rails_env
    mysql_user       = var.mysql_user
    mysql_host       = var.mysql_host
    secret_key_base  = var.secret_key_base
  }
}

resource "aws_ecs_task_definition" "JAI-TERRA-TD-web" {
  family                   = "JAI-TERRA-TD-web"
  network_mode             = "awsvpc"
  requires_compatibilities = ["EC2"]
  cpu                      = "256"
  memory                   = "256"

  execution_role_arn = "arn:aws:iam::156916773321:role/ecsTaskexecution-Jai"
  task_role_arn      = "arn:aws:iam::156916773321:role/ecsTaskexecution-Jai"

  container_definitions = data.template_file.taskdef.rendered

  runtime_platform {
    cpu_architecture        = "X86_64"
    operating_system_family = "LINUX"
  }
}
