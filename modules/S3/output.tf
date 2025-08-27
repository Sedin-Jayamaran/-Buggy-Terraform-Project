output "artifact_bucket_name" {
  description = "The name of the artifact store S3 bucket"
  value       = aws_s3_bucket.jai-s3-store.bucket
}

output "artifact_bucket_arn" {
  description = "The ARN of the artifact store S3 bucket"
  value       = aws_s3_bucket.jai-s3-store.arn
}
