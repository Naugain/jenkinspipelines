/* RESOURCE SYNTAX
  resource "<PROVIDER_TYPE>" "<LOCAL_NAME>" {
  <ARGUMENT_KEY> = <VALUE>
  }
*/

/*
  data "<PROVIDER_TYPE>" "<LOCAL_NAME>" {
    <ARGUMENT_KEY> = <VALUE>
  }
*/

/*
  depends_on Meta-Argument (within any block)
    depends_on = [
      <RESOURCE_REF>,
      <MODULE_REF>
    ]
*/

# resource "aws_s3_bucket" "terra_bucket1" {
# bucket = var.bucket_name

# tags = {
# Name        = "terraform_created_bucket"
# Environment = "test_deployment_terraform_practice"
# }
# }

module "dev_instance" {
  source        = "./modules/ec2_instance"
  instance_type = var.dev_instance_type
  ami_name_regx = var.dev_ami_name_regx
  public_key    = var.dev_public_key
}