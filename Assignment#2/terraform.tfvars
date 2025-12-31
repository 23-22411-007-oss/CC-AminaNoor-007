vpc_cidr_block    = "10.0.0.0/16"
subnet_cidr_block = "10.0.10.0/24"
availability_zone = "me-central-1a"

env_prefix    = "prod"
instance_type = "t3.micro"

public_key  = "~/.ssh/id_ed25519.pub"
private_key = "~/.ssh/id_ed25519"

backend_servers = [
  {
    name        = "web-1"
    script_path = "scripts/apache-setup.sh"
    suffix      = "backend-1"
  },
  {
    name        = "web-2"
    script_path = "scripts/apache-setup.sh"
    suffix      = "backend-2"
  },
  {
    name        = "web-3"
    script_path = "scripts/apache-setup.sh"
    suffix      = "backend-3"
  }
]

