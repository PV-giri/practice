terraform {
  backend "s3" {
    bucket = "pvbucketforcheck"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_instance" "AWSServer" {
  ami           = "ami-0747bdcabd34c712a"
  instance_type = "t2.micro"
  key_name      = "krishnakey"
  tags = {
    Name = "terraform_1"
  }
}

output "public_ip" {
  value = "${aws_instance.AWSServer.public_ip}"
}

output "private_ip" {
  value = "${aws_instance.AWSServer.private_ip}"
}

output "ec2_id" {
  value = "${aws_instance.AWSServer.id}"
}

