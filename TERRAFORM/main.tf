resource "aws_instance" "server" {
    ami_id = "${var.source_ami}"
    instance_type = var.instance_type
    vpc_security_group_ids = ["${var.security_group_ids}"]
    subnet_id = var.subnet_id
    tags = {
        Name = "packer-amazon-ebs-clean"
    }
}