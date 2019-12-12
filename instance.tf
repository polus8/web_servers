resource "aws_instance" "webserver-instance" {
  ami           = var.AMIS[var.AWS_REGION]
  availability_zone = var.AWS_ZONE1
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.webserver-securitygroup.id]

  # the public SSH key
  key_name = aws_key_pair.ssh_key_webserver.key_name
  
  
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh",
	  "sudo chmod 777 /var/www/html/index.nginx-debian.html",
    ]
  }
  
  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }
  
  #user data
  #user_data       = "'this is: webserver-instance' > /var/www/html/index.nginx-debian.html"
  
  provisioner "file" {
    source      = "index.nginx-debian.html"
    destination = "/var/www/html/index.nginx-debian.html"
  }
  
}

resource "aws_instance" "webserver-instance-2" {
  ami           = var.AMIS[var.AWS_REGION]
  availability_zone = var.AWS_ZONE2
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-2.id

  # the security group
  vpc_security_group_ids = [aws_security_group.webserver-securitygroup.id]

  # the public SSH key
  key_name = aws_key_pair.ssh_key_webserver.key_name
  
  
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh",
	  "sudo chmod 777 /var/www/html/index.nginx-debian.html",
    ]
  }
  
  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }
  
  #user data
  #user_data       = "echo 'this is: webserver-instance-2' > /var/www/html/index.nginx-debian.html"
  
  provisioner "file" {
    source      = "index.nginx-debian2.html"
    destination = "/var/www/html/index.nginx-debian.html"
  }

}