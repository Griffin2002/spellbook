source "amazon-ebs" "clean" {
  ami_name           = "packer-amazon-ebs-clean"
  instance_type      = "t2.micro"
  source_ami         = var.source_ami
  ssh_username       = var.ssh_username
  vpc_id             = var.vpc_id
  subnet_id          = var.subnet_id
  security_group_ids = ["${var.security_group_ids}"]
  region             = var.region
  tags = {
    Name = "packer-amazon-ebs-clean"
  }
}

build {
    sources = ["source.amazon-ebs.clean"]
    provisioner "shell" {
        inline = [sudo apt-get update -y]
    }
    provisioner "ansible" {
        playbook = "./install.yml"
    }
}

variable "source_ami" {
  type = string
}
variable "ssh_username" {
  type    = string
  default = "ubuntu"
}
variable "vpc_id" {
  type = string
}
variable "subnet_id" {
  type = string
}
variable "security_group_ids" {
  type    = list(string)
  default = nuill
}
variable "region" {
  type = string
}