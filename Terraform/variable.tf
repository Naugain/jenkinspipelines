/*
variable "<NAME>" {
  <ARGUMENT_KEY> = <VALUE>
}
      Defines inputs
      Common keys: type, default, description, sensitive
*/

variable "aws_region" {
  description = "region to deploy/fetch resources in/out of"
  type        = string
  default     = "us-east-1"
}

# variable "bucket_name" {
# description = "bucket name receiver variable"
# type        = string
# }

variable "dev_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "dev_public_key" {
  type        = string
  description = "public key holder form variable.tf file"
}

variable "dev_ami_name_regx" {
  type        = list(string)
  description = "ami_name value defined in terraform.tfvar"
}
