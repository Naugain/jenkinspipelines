/*
output "<NAME>" {
  value = <EXPRESSION>
  <OPTIONAL_ARGUMENT> = <VALUE>
}
*/

# output "bucket_name" {
# value = aws_s3_bucket.terra_bucket1.bucket
# }

# output "bucket_arn" {
# value = aws_s3_bucket.terra_bucket1.arn
# }

output "instance_name" {
  value = module.dev_instance.instance_name
}

output "instance_puplic_ip" {
  value = module.dev_instance.instance_puplic_ip
}

output "instance_ID" {
  value = module.dev_instance.instance_id
}

output "instance_arn" {
  value = module.dev_instance.instance_arn
}

output "instance_ami" {
  value = module.dev_instance.instance_ami
}
