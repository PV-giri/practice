/* provider "aws" {
  region     = "us-west-1"
  access_key = "AKIAXXFEOCX4P73ZBKI3"
  secret_key = "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"
} */

resource "aws_instance" "AWSServer" {
  ami           = "ami-027be456e3593dc56"
  instance_type = "t2.micro"
  key_name      = "jenkins"
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
