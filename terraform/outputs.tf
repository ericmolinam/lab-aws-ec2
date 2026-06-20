output "public_ip" {
  value = aws_instance.this.public_dns
}

output "private_key_s3_uri" {
  value = "s3://${aws_s3_bucket.this.id}/private_key.pem"
}