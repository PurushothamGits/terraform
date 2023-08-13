module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "MNP-Terraform"

  instance_type          = var.INSTANCE_TYPE
  key_name               = "MyDevops_NV"
  monitoring             = false
  vpc_security_group_ids = ["sg-0969e41e0d5891767"]
  subnet_id              = "subnet-0bc5686fe387a6256"

  tags = {
    Terraform   = "true"
    Environment = "dev"
    project     = "My Project"
    owner       = "Devops"
  }
}
