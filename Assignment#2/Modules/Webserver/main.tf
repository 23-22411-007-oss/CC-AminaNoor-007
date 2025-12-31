########################################
# AWS Key Pair
########################################

resource "aws_key_pair" "this" {
  key_name   = "${var.env_prefix}-${var.instance_name}-${var.instance_suffix}-key"
  public_key = file(var.public_key)
}

########################################
# EC2 Instance
########################################
resource "aws_instance" "my_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id          # pass from root module
  vpc_security_group_ids = var.security_group_ids
  key_name      = var.key_name
}



