module "vpc" {
  source = "./modules/VPC"

  vpc_name              = var.vpc_name
  vpc_cidr              = var.vpc_cidr
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
  availability_zones    = var.availability_zones
  project_name          = var.project_name
}

module "securitygroup" {
  source = "./modules/securitygroup"

  vpc_id = module.vpc.vpc_id
}

module "ecs" {
  source = "./modules/ECS"

  ecs_security_group_id      = module.securitygroup.ecs_security_group_id
  public_subnet = module.vpc.public_subnet_ids
  target_group_arn      = module.alb.target_group_arn
  rails_env       = var.rails_env
  mysql_user      = var.mysql_user
  mysql_password  = var.mysql_password
  mysql_host      = var.mysql_host
  mysql_port      = var.mysql_port
  mysql_database  = var.mysql_database
  secret_key_base = var.secret_key_base
  image_url       = var.image_url
  key_name = var.key_name 
}

module "alb" {
  source = "./modules/ALB"
  ecs_security_group_id = module.securitygroup.ecs_security_group_id
  public_subnet = module.vpc.public_subnet_ids
  vpc = module.vpc.vpc_id
  target = module.ecs.target_group_arn
}

module "codebuild" {
  source = "./modules/CodeBuild"
}

module "RDS"{
  source = "./modules/RDS"
  rds_subnet=module.vpc.private_subnet_ids
  security=module.securitygroup.ecs_security_group_id
}
module "S3"{
  source = "./modules/S3"
}
module "codepipeline"{
  source = "./modules/CodePipeline"
  bucket = module.S3.artifact_bucket_name
  build = module.codebuild.codebuild
}
