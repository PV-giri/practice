resource "aws_instance" "AWSServer" {
  count = "${var.env == "prod" ?  3:1}"
  ami           = "${var.ami}"
  instance_type = "t2.micro"
  key_name      = "jenkins"
   /* user_data = << EOF
  #! /bin/bash
  sudo apt-get update
  sudo apt-get install -y apache2
  sudo systemctl start apache2
  sudo systemctl enable apache2
  echo "The page was created by the user data" | sudo tee /var/www/html/index.html
  EOF */
   lifecycle {
    create_before_destroy = true
    prevent_destroy = false
    /* ignore_changes = [
      tags,
    ] */
  }
    tags = {
    Name = "terraform ${( count.index+1 )}"
    Env = "${var.Env}"
  }
}
