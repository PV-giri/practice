resource "null_resource" "cluster" {
  count = "${var.Env == "prod" ?  3:1}"

provisioner "file" {
    content     = "script.sh"
    destination = "/tmp/script.sh"
    connection {
        type =  "ssh"
        user = "ubuntu"
        private_key = "${file("jenkins.pem")}"
        host = "${element(aws_instance.AWSServer.*.public_ip, count.index)}"

    }
  }  


















  }