output "Link" {
  value = "${aws_route53_record.nagiosxi.name}:80"
}
