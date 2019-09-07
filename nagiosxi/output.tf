output "Link" {
  value = "${aws_route53_record.nagios.name}:80"
}
