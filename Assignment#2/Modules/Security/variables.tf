variable "vpc_id" {
  description = "VPC ID where security groups will be created"
  type        = string
}

variable "env_prefix" {
  description = "Environment prefix for resource naming and tagging"
  type        = string
}

variable "my_ip" {
  description = "Your public IP address in CIDR format (e.g., 203.0.113.5/32)"
  type        = string
  default     = "103.229.252.19/32"
}
