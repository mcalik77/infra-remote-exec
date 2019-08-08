resource "aws_key_pair" "developer_key" {
    key_name = "developer_key"
    public_key = "${file("~/.ssh/id_rsa.pub")}"
}
