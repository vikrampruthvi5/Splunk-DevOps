
resource "aws_instance" "ec2_instance-1" {
  ami           = data.aws_ami.linux_ami_latest.id
  instance_type = "t3.medium"
  key_name      = data.aws_key_pair.ec2-kp-data.key_name

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/id_rsa")
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "Scripts/splunk-forwarder.sh"
    destination = "/tmp/splunk-forwarder.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/splunk-forwarder.sh",
      "sudo /tmp/splunk-forwarder.sh ${aws_instance.ec2_instance.public_ip}",
    ]

  }

  # Replace with the desired subnet ID
  subnet_id = aws_subnet.subnet1.id

  # Replace with the desired security group IDs
  vpc_security_group_ids = [
    aws_security_group.kafka-sg.id
  ]

  root_block_device {
    volume_size = 10
    volume_type = "gp2"
  }

  tags = {
    Name = "${var.project}-Forwarder-Instance"
  }
}

# resource "aws_volume_attachment" "ebs_attachment-1" {
#   device_name = "/dev/sdf"
#   volume_id   = aws_ebs_volume.ebs_volume-1.id
#   instance_id = aws_instance.ec2_instance-1.id
# }

# resource "aws_ebs_volume" "ebs_volume-1" {
#   availability_zone = "us-east-1a"
#   size              = 10
#   tags = {
#     Name = "${var.project}-AdditionalVolume"
#   }
# }