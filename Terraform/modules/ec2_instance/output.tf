output "instance_name" {
  value = aws_instance.ec2_instance.tags["Name"]
}

output "instance_puplic_ip" {
  value = aws_instance.ec2_instance.public_ip
}

output "instance_id" {
  value = aws_instance.ec2_instance.id
}

output "instance_arn" {
  value = aws_instance.ec2_instance.arn
}

output "instance_ami" {
  value = data.aws_ami.instance_ami.id
}