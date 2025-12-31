######################################################
# Root main.tf for Assignment 2 - Multi-tier Web Infra
######################################################

# =========================
# Variables
# =========================
variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "Subnet CIDR block"
  type        = string
  default     = "10.0.1.0/24"
}

# =========================
# Networking Module
# =========================
module "networking" {
  source            = "./modules/networking"
  env_prefix        = var.env_prefix
  vpc_cidr_block    = var.vpc_cidr_block
  subnet_cidr_block = var.subnet_cidr_block
  availability_zone = var.availability_zone
}

# =========================
# Security Module
# =========================
module "security" {
  source     = "./modules/security"
  my_ip      = "103.229.252.19/32"         # <-- your public IP
  vpc_id     = module.networking.vpc_id
  env_prefix = var.env_prefix
}

# =========================
# WebServer Module
# =========================
module "webserver" {
  source              = "./modules/webserver"
  ami_id              = "ami-09f99d9fb80fc77d2"
  instance_type       = "t3.micro"
  subnet_id           = aws_subnet.my_subnet.id
  security_group_ids  = [aws_security_group.my_sg.id]
  key_name            = "your-key-name"
}

# =========================
# Nginx Server (Reverse Proxy)
# =========================
module "nginx_server" {
  source            = "./modules/webserver"
  env_prefix        = var.env_prefix
  instance_name     = "nginx-proxy"
  instance_type     = var.instance_type
  availability_zone = var.availability_zone
  vpc_id            = module.networking.vpc_id
  subnet_id         = module.networking.subnet_id
  security_group_id = module.security.nginx_sg_id
  public_key        = var.public_key
  script_path       = "./scripts/nginx-setup.sh"
  instance_suffix   = "nginx"
  common_tags       = var.common_tags
}
# =========================
# Backend Servers (Apache)
# =========================
module "backend_servers" {
  for_each = { for server in local.backend_servers : server.name => server }

  source            = "./modules/webserver"
  env_prefix        = var.env_prefix
  instance_name     = each.value.name
  instance_type     = var.instance_type
  availability_zone = var.availability_zone
  vpc_id            = module.networking.vpc_id
  subnet_id         = module.networking.subnet_id
  security_group_id = module.security.backend_sg_id
  public_key        = var.public_key
  script_path       = each.value.script_path
  instance_suffix   = each.value.suffix
  common_tags       = var.common_tags
}