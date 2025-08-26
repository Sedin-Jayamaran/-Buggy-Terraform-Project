variable "ecs_security_group_id"{
    type = string
}
variable "public_subnet"{
    type = list(string)
}
variable "target_group_arn" {
  type        = string
  description = "The ARN of the Target Group for ECS Service"
}
variable "rails_env" {
  type = string
}

variable "mysql_user" {
  type = string
}

variable "mysql_password" {
  type      = string
  sensitive = true
}

variable "secret_key_base" {
  type = string
}

variable "image_url" {
  type = string
}

variable "mysql_host" {
  type = string
}

variable "mysql_database" {
  type = string
}

variable "mysql_port" {
  type = number
}
