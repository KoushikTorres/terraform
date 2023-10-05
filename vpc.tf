Tasks To Be Performed: 
1.Destroy the previous deployments 
2.Create a VPC with the required components using Terraform 
3.Deploy an EC2 instance inside the VPC

STEP1: 
Create a vpc 

vi main.tf

CODE:
-------------------------------------------------------------------
Provider “aws” {
  Region = “us-east-1”
}
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "terra-test"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "test"
  }
}
-----------------------------------------------------------------------
# terraform init
# terraform plan
# terraform apply

# terraform show
--------------------------------------------------------------------
STEP2: Creating ec2 inside the vpc created.
CODE UPDATE:
----------------------------------
provider "aws" {
  region = "us-east-1"
}
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = "terra-test"
  cidr = "10.0.0.0/16"
  
  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true
  tags = {
    Terraform = "true"
    Environment = "test"
  }
}
#adding ec2 instance---------------------------------------------------
resource "aws_instance" "app_server" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro" 
  subnet_id     = "subnet-0ddf6f31217425ffc"

  tags = {
    Name = "terraform-iac-1"
  }
}

----------------------------------------------------------------------------------------
CHECK THE RESOURCES:



VPC AND EC2 has been deployed successfully!
