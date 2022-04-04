provider "aws" {
  region     = "${var.region}"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

resource "aws_instance" "AWSServer" {
  count = 3
  ami           = "${var.ami}"
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
