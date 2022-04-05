terraform {
  backend "s3" {
    bucket = "mysecondbucketforcheck"
    key    = "devops.statefile"
    region = "us-west-1"
  }
  depends_on = [
    aws_s3_bucket.my_s3_bucket,
  ]
}