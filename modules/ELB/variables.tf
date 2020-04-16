variable "elb_name" {
  default = "consul-elb"
}

variable "health_check_target" {
  default = "TCP:8500"
}
variable "consul_subnets" {
  description = "The subnets for the Consul cluster"
  type        = "list"
}
variable "security_groups" {
  type = "list"
}

variable "servers" {}

variable "clients" {}

variable "servers_instance_ids" {
  type = "list"
}

variable "clients_instance_ids" {
  type = "list"
}
