resource "aws_instance" "AWSServer" {
  count = 3
  ami           = "${var.ami}"
  instance_type = "t2.micro"
  key_name      = "jenkins"
  tags = {
    Name = "terraform ${( count.index+1 )}"
  }
}

