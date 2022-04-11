resource "null_resource" "cluster" {
  count = 2

provisioner "file" {
    source     = "script.sh"
    destination = "/tmp/script.sh"
    connection {
        type =  "ssh"
        user = "ubuntu"
        private_key = "${file("jenkins.pem")}"
        host = "${element(aws_instance.AWSServer.*.public_ip, count.index)}"

    }
  }  


















  }