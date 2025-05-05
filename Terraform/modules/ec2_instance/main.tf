
resource "aws_key_pair" "instance_key" {
  key_name_prefix = "terra"
  public_key      = var.public_key
}

data "aws_ami" "instance_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = var.ami_name_regx
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "ec2_instance" {
  ami           = data.aws_ami.instance_ami.id
  instance_type = var.instance_type
  key_name      = aws_key_pair.instance_key.key_name

  tags = {
    Name = "terra_instance"
  }
}