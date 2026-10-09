output "instance_id" {
  description = "ID of the created EC2 instance."
  value       = aws_instance.ec2.id
}

output "instance_public_ip" {
  description = "Public IP address of the created EC2 instance."
  value       = aws_instance.ec2.public_ip
}

output "ssh_key_pair_name" {
  description = "Name of the registered SSH key pair."
  value       = aws_key_pair.keypair.key_name
}