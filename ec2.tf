resource "aws_instance" "AWSServer" {
  count = 3
  ami           = "${var.ami}"
  instance_type = "t2.micro"
  key_name      = "jenkins"
  /* user_data = << EOF
		#! /bin/bash
    sudo apt-get update
		sudo apt-get install -y apache2
		sudo systemctl start apache2
		sudo systemctl enable apache2
	EOF */
   lifecycle {
    create_before_destroy = true
    prevent_destroy = false
    ignore_changes = [
      tags,
  }
    tags = {
    Name = "terraform ${( count.index+1 )}"
  }
}
