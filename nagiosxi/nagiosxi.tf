resource "aws_instance" "nagios" {
    ami = "${var.ami}"
    instance_type = "${var.instance_type}"
    key_name =  "${var.key_name}"
    associate_public_ip_address = true
    security_groups = ["${aws_security_group.nagiosxi.name}"]

    provisioner "remote-exec" {
        connection {
            host = "${self.public_ip}"
            type = "ssh"
            user  = "${var.user}"
            private_key = "${file("~/.ssh/id_rsa")}"
        }
        inline  = [
            "sudo  yum install unzip curl -y",
            "sudo curl https://assets.nagios.com/downloads/nagiosxi/install.sh | sh"

        ]
    }
}
