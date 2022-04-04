provider "aws" {
  region     = "us-west-1"
  access_key = "AKIAXXFEOCX4KOUBVLHP"
  secret_key = "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"
}

resource "aws_instance" "AWSServer" {
  count = 3
  ami           = "ami-027be456e3593dc56"
  instance_type = "t2.micro"
  key_name      = "jenkins"
  tags = {
    Name = "terraform ${( count.index+1 )}"
  }
}

/* output "public_ip" {
  value = "${aws_instance.AWSServer.public_ip}"
}

output "private_ip" {
  value = "${aws_instance.AWSServer.private_ip}"
}

output "ec2_id" {
  value = "${aws_instance.AWSServer.id}"
} */
