output "Link" {
  value = "${aws_route53_record.r1soft.name}:8443"
}
