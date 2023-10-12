module "vpc" {
  source = "./vpc"
  vpc_id = module.vpc.vpc_id
}

module "security_group" {
  source = "./securitygroup"
  vpc_id = module.vpc.vpc_id
}

module "ansible" {
  source = "./ec2"

  instance_name = "ansible"
  vpc_id = module.vpc.vpc_id
  security_group_id = module.security_group.security_group_id
  public_subnet_id = module.vpc.public_subnet_id
  user_data = <<-EOF
  #!/bin/bash
  apt update -y
  apt install software-properties-common
  add-apt-repository --yes --update ppa:ansible/ansible
  apt install ansible -y
  EOF
}

module "jenkins-master" {
  source = "./ec2"

  instance_name = "jenkins-master"
  vpc_id = module.vpc.vpc_id
  security_group_id = module.security_group.security_group_id
  public_subnet_id = module.vpc.public_subnet_id

}

module "jenkins-slave" {
  source = "./ec2"

  instance_name = "jenkins-slave"
  vpc_id = module.vpc.vpc_id
  security_group_id = module.security_group.security_group_id
  public_subnet_id = module.vpc.public_subnet_id

}