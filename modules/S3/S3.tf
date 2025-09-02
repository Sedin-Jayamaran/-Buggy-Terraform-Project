
resource "aws_s3_bucket" "jai-s3-store" {
  bucket = var.bucket_name

  tags = {
    Name        = "jai-terra-bucket"
    Environment = "artifact store"
  }
}


