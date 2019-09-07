resource "aws_route53_record" "nagiosxi" {
  zone_id = "${var.zone_id}"
  name    = "${var.record}.${var.domain}"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.nagiosxi.public_ip}"]
}