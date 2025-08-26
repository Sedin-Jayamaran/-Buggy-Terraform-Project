variable "ecs_security_group_id"{
    type = string
}
variable "public_subnet" {
    type = list(string)
}
variable "vpc"{
    type = string
}
variable "target" {
    type = string
}