terraform {
  backend "s3" {
    bucket = "myfirstbucketforcheck"
    key    = "devops.tfstate"
    region = "us-east-1"
  }
}