[
  {
    "name": "buggy-web-terra",
    "image": "${image_url}",
    "cpu": 0,
    "essential": true,
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80,
        "protocol": "tcp"
      },
      {
        "containerPort": 3000,
        "hostPort": 3000,
        "protocol": "tcp"
      }
    ],
    "environment": [
      { "name": "MYSQL_DATABASE", "value": "${mysql_database}" },
      { "name": "MYSQL_PASSWORD", "value": "${mysql_password}" },
      { "name": "MYSQL_PORT", "value": "${mysql_port}" },
      { "name": "RAILS_ENV", "value": "${rails_env}" },
      { "name": "MYSQL_USER", "value": "${mysql_user}" },
      { "name": "MYSQL_HOST", "value": "${mysql_host}" },
      { "name": "SECRET_KEY_BASE", "value": "${secret_key_base}" }
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "/ecs/JAI-TERRA-TD-web",
        "awslogs-create-group": "true",
        "awslogs-region": "ap-south-1",
        "awslogs-stream-prefix": "ecs"
      }
    }
  }
]
