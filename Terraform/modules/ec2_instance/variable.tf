variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "public_key" {
  type = string
  description = "public key value assined variable.tf file"  
}

variable "ami_name_regx" {
  type = list(string)
  description = "ami_name value defined in terraform.tfvar"
}

# variable "terra_instance_ami" {
  # description = "variably named instance ID"
  # type        = string
# }
