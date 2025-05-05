// This file is to assign values to the variables declared in variable.tf file
# bucket_name = "kunal-bucket-terraform-created-121294"

// dev_instance_ami = "ami-07a6f770277670015" // ami id value assigned

dev_instance_type = "t2.micro" // instance type value assigned
dev_public_key    = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKYoQKAKcj7XcwlvHYqUCynw1B2nzkRIuiQbuif9nn1e kunal@Kunal"
dev_ami_name_regx = ["al2023-ami-2023*-x86_64"] # al2023-ami-2023.7.20250414.0-kernel-6.1-x86_64