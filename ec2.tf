Tasks To Be Performed:
1.Create an EC2 service in the default subnet in the Ohio region.

STEP1: Install terraform

TERRAFORM Installation.
--------------------------
EC2 with admin iam-role
================================
Install terraform on ubuntu.
-------------------------------

https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

INSTALL aws cli

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install



CONFIGURE USER ACCESS

export AWS_ACCESS_KEY_ID=AKIAR7GIJUY624S4C4R
export AWS_SECRET_ACCESS_KEY=is71L8/gNGMExhrJXkmnB/+nsgUUfZ+CMhq3iqo

CREATE TF FILE for configuration:

touch main.tf
----------------------------------------------------------------------------------------------------
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-024e6efaf93d85776"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-iac-1"
  }
}
----------------------------------------------------------------------------------------
Terraform init




Terraform plan   --->to see the changes can be added to infra.

 Terraform validate  ---> validating the tf file.


Terraform apply   ---> to apply or run the tf file.



EC2 created in an default subnet.



Build success!

To see more informations .

Terraform show



To delete the infra:

Terraform destroy




TASK COMPLETED!
