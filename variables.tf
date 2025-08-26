variable "vpc_name" {
  description = "Name tag for the VPC"
  type        = string
}
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for the private subnets"
  type        = list(string)
}


variable "availability_zones" {
  description = "Availability zones for the subnets"
  type        = list(string)
}

variable "project_name" {
  description = "Prefix for naming resources"
  type        = string
  default     = "my-project"
}

variable "key_name" {
  type        = string
  description = "SSH key"
}

variable "volume_size" {
  type        = string
  description = "Volume size"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "rails_env" {
  description = "Rails environment"
  type        = string
}

variable "mysql_user" {
  description = "MySQL username"
  type        = string
}

variable "mysql_password" {
  description = "MySQL password"
  type        = string
  sensitive   = true
}

variable "mysql_host" {
  description = "MySQL host address"
  type        = string
}

variable "mysql_port" {
  description = "MySQL port"
  type        = number
  default     = 3306
}

variable "mysql_database" {
  description = "MySQL database name"
  type        = string
}

variable "secret_key_base" {
  description = "Rails secret key base"
  type        = string
  sensitive   = true
}

variable "image_url" {
  description = "Docker image for ECS task"
  type        = string
}
