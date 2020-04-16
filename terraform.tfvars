namespace = "consul-demo"

instance_type = "t2.micro"

servers = 3

clients = 2

aws_region = "us-east-2"

aws_profile = "default"

cidr_blocks = ["10.1.1.0/24", "10.1.2.0/24"]

vpc_cidr_block = "10.1.0.0/16"

consul_version = "1.7.2"

sg_cidr = "0.0.0.0/0"

consul_join_tag_key = "consul_join"

consul_join_tag_value = "training"

public_key_path = "~/.ssh/id_rsa.pub"

ownerid = "099720109477"

virtualization_type = "hvm"

ami_name = "ubuntu/images/hvm/ubuntu-trusty-14.04"

channel = "amd64-server"
