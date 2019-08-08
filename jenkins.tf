resource "aws_instance" "jenkins" {
    ami = "${var.ami}"
    instance_type = "${var.instance_type}"
    key_name =  "${aws_key_pair.developer_key.id}"
    associate_public_ip_address = true
    security_groups = ["${aws_security_group.jenkins.id}"]

    provisioner "remote-exec" {
        connection {
            host = "${self.public_ip}"
            type = "ssh"
            user  = "${var.user}"
            private_key = "${file("~/.ssh/id_rsa")}"
        }
        inline  = [
            "sudo yum install java-1.8.0-openjdk-devel",
            "curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo",
            "sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key",
            "sudo yum install jenkins -y",
            "sudo systemctl start jenkins"
        ]
    }
}
