## Provisioning Consul CLuster on AWS with terraform modules

For this works you need expose your aws credentials and change your key pem for you own inside the -> aws-consul-tf/terraform.tfvars on "key_name" change for your own.

For security concerns and if you willl use it in Production you should after deploy a bastion to be able to jump to your own cluster servers, I didnt did this here because my intentation is to do a test.

Also to Create another EC2 security group for just the Consul server instances with only consul ports that need to be open of course respecting the server that you will used inside your project:

```
Server RPC (Default 8300). This is used by servers to handle incoming requests from other agents. TCP only.
Serf LAN (Default 8301). This is used to handle gossip in the LAN. Required by all agents. TCP and UDP.
Serf WAN (Default 8302). This is used by servers to gossip over the WAN to other servers. TCP and UDP.
CLI RPC (Default 8400). This is used by all agents to handle RPC from the CLI. TCP only.
HTTP API (Default 8500). This is used by clients to talk to the HTTP API. TCP only.
DNS Interface (Default 8600). Used to resolve DNS queries. TCP and UDP.
```
```
Example:

//  The Consul admin UI is exposed over 8500...
  ingress {
    from_port   = 8500
    to_port     = 8500
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
```

