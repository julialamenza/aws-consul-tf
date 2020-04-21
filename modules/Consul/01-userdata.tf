# Get the list of official Canonical Ubunt 14.04 AMIs
data "aws_ami" "consul" {
  most_recent = true

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["${var.virtualization_type}"]
  }

  filter {
    name   = "name"
    values = ["${var.ami_name}-${var.channel}-*"]
  }

  owners = ["${var.ownerid}"]
}

# Create the user-data for the Consul server
data "template_file" "server" {
  count    = "${var.servers}"
  template = "${file("${path.module}/templates/consul.sh.tpl")}"

  vars = {
    consul_version = "${var.consul_version}"

    config = <<EOF
     "bootstrap_expect": ${var.servers},
     "client_addr": "0.0.0.0",
     "acl_default_policy":"allow",
     "acl_down_policy":"allow",
     "node_name": "${var.namespace}-server-${count.index}",
     "server": true,
     "ui": true,
     "retry_join": ["provider=aws tag_key=${var.consul_join_tag_key} tag_value=${var.consul_join_tag_value}"]
          
    EOF
  }
}

# Create the user-data for the Consul server
data "template_file" "client" {
  count    = "${var.clients}"
  template = "${file("${path.module}/templates/consul.sh.tpl")}"

  vars = {
    consul_version = "${var.consul_version}"

    config = <<EOF
     "node_name": "${var.namespace}-client-${count.index}",
     "client_addr": "0.0.0.0",
     "server": false,
     "ui": true,
     "retry_join": ["provider=aws tag_key=${var.consul_join_tag_key} tag_value=${var.consul_join_tag_value}"]
    EOF
  }
}
