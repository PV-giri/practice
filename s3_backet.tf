resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "mysecondbucketforcheck"

  tags = {
    Name        = "My-second-bucket"
    Environment = "Dev"
  }
}