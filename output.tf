output "webserver-ip" {
  value =aws_instance.webserver-instance.*.public_ip
}

output "webserver-ip-2" {
  value =aws_instance.webserver-instance-2.*.public_ip
}

output "ELB" {
  value = aws_elb.my-elb.dns_name
}
