output "splunk-public-ip" {
  value = aws_instance.ec2_instance.public_ip
}

output "forwarder-public-ip" {
  value = aws_instance.ec2_instance-1.public_ip

}