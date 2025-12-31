########################################
# Networking Variables
########################################

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string

}

variable "subnet_cidr_block" {
  description = "CIDR block for the public subnet"
  type        = string

  validation {
    condition     = can(cidrnetmask(var.subnet_cidr_block))
    error_message = "The subnet CIDR block must be a valid IPv4 CIDR range."
  }
}

variable "availability_zone" {
  description = "Availability Zone where resources will be deployed"
  type = string
  default = "us-east-1a"
}

########################################
# Environment Variables
########################################

variable "env_prefix" {
  description = "Environment prefix (dev, prod, test)"
  type        = string
  default     = "dev"
}
########################################
# EC2 Variables
########################################

variable "instance_type" {
  description = "EC2 instance type for web servers"
  type        = string
  default     = "t3.micro"
}

variable "public_key" {
  description = "Path to the SSH public key"
  type        = string
}

variable "private_key" {
  description = "Path to the SSH private key"
  type        = string
  sensitive   = true
}

########################################
# Backend Servers Configuration
########################################

variable "backend_servers" {
  description = "List of backend servers"
  type = list(object({
    name        = string
    script_path = string
    suffix      = string
  }))
}

variable "common_tags" {
  type = map(string)
  default = {
    Project = "TerraformAssignment"
    Owner   = "Amina"
  }
}