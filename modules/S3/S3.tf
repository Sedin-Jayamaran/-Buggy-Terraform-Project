resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "jai-s3-store" {
  bucket = "jai-terra-bucket-${random_id.suffix.hex}"

  tags = {
    Name        = "jai-terra-bucket"
    Environment = "artifact store"
  }
}


