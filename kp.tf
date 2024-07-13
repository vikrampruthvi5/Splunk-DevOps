resource "aws_key_pair" "ec2-kp" {
  key_name   = "${var.project}-kp"
  public_key = file("~/.ssh/id_rsa.pub")
}