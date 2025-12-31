########################################
# Dynamic IP Detection
########################################
data "http" "my_ip" {
  url = "https://icanhazip.com"
}

locals {
  # Get your current public IP dynamically
  my_ip = "${chomp(data.http.my_ip.response_body)}/32"

  ########################################
  # Common Tags
  ########################################
   common_tags = {
    Project = "WebApp"
    Owner   = "Amina"
  }

  ########################################
  # Backend Server Configurations
  ########################################
  backend_servers = [
    {
      name        = "web-1"
      script_path = "./scripts/apache-setup.sh"
      suffix      = "backend-1"
    },
    {
      name        = "web-2"
      script_path = "./scripts/apache-setup.sh"
      suffix      = "backend-2"
    },
    {
      name        = "web-3"
      script_path = "./scripts/apache-setup.sh"
      suffix      = "backend-3"
    }
  ]

  ########################################
  # Resource Naming Convention
  ########################################
  resource_names = {
    vpc         = "${var.env_prefix}-vpc"
    public_subnet = "${var.env_prefix}-public-subnet"
    nginx_sg    = "${var.env_prefix}-nginx-sg"
    backend_sg  = "${var.env_prefix}-backend-sg"
    public_rt   = "${var.env_prefix}-public-rt"
  }
}
