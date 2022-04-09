resource "aws_instance" "AWSServer" {
  count = 3
  ami           = "${var.ami}"
  instance_type = "t2.micro"
  key_name      = "jenkins"
      user_data = << EOF
		#! /bin/bash
    sudo apt-get update
		sudo apt-get install -y nginx
		sudo systemctl start nginx
		sudo systemctl enable nginx
	EOF 
   lifecycle {
    create_before_destroy = true
    prevent_destroy = false
    /* ignore_changes = [
      tags,
    ] */
  }
    tags = {
    Name = "terraform ${( count.index+1 )}"
  }
}
