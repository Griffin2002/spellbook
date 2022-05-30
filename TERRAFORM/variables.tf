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
  default = null
}
variable "region" {
  type = string
}
variable "instance_type" {
  type = string
}
