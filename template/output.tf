output "Link" {
  value = "${aws_route53_record.example.name}:8443"
}
