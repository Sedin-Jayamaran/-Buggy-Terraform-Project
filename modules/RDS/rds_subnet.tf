resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "jai-rds-subnet-group"
  subnet_ids = var.rds_subnet

  tags = {
    Name = "Jai-rds-subnet-group"
  }
}