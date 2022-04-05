terraform {
  backend "s3" {
    bucket = "mysecondbucketforcheck"
    key    = "devops.statefile"
    region = "us-west-1"
  }
}