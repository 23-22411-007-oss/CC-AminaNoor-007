variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
}

variable "env_prefix" {
  description = "Environment prefix"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for subnet"
  type        = string
}

variable "subnet_cidr_block" {
  description = "CIDR block for subnet"
  type        = string
}
