variable "env_prefix" {
  description = "Environment prefix for resource naming"
  type        = string
}

variable "instance_name" {
  description = "Name of the instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for the instance"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID to attach"
  type        = string
}

variable "public_key" {
  description = "Path to SSH public key"
  type        = string
}

variable "script_path" {
  description = "Path to user data script"
  type        = string
}

variable "instance_suffix" {
  description = "Suffix to make resources unique"
  type        = string
}

variable "common_tags" {
  description = "Common tags map"
  type        = map(string)
}

variable "ami_id" {}