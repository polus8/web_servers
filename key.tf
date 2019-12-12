resource "aws_key_pair" "ssh_key_webserver" {
  key_name   = "ssh_key_webserver"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
  lifecycle {
    ignore_changes = [public_key]
  }
}

