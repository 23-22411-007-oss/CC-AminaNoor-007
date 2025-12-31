# Output the VPC ID from the networking module
output "vpc_id" {
  description = "ID of the VPC"
  value = module.networking.vpc_id
}

# Output the Subnet ID from the networking module
output "subnet_id" {
  description = "ID of the public subnet"
  value       = module.networking.subnet_id
}

# Output the Nginx server public IP
output "nginx_public_ip" {
  description = "Public IP of the Nginx server"
  value       = module.nginx_server.public_ip
}

# Output all backend server public IPs
output "backend_public_ips" {
  description = "Public IPs of all backend servers"
  value       = [for s in module.backend_servers : s.public_ip]
}
