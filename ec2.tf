provider "aws" {
  region     = "us-west-1"
  access_key = "AKIA2FZAELTSMBELZI4D"
  secret_key = "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"
}

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
