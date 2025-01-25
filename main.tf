#Banckend configuration to store the tfstate file 

terraform {
  backend "s3" {
    bucket = "web-s3-tfstate-bucket"
    key    = "myproject/dev/terraform.tfstate"
    encrypt        = true
    region = "ap-southeast-2"
  }
}

# Providers details
provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_instance" "node_app" {
  ami           = "ami-003f5a76758516d1e" # Ubuntu Server 20.04 LTS
  instance_type = "t2.micro"
  subnet_id     = "subnet-06890c2f98c212144"
 
  tags = {
    Name = "NodeAppInstance"
  }
  #user_data = "IyEvYmluL2Jhc2gKc3VkbyBhcHQgdXBkYXRlIC15CnN1ZG8gYXB0IGluc3RhbGwgbmdpbnggLXkKc3VkbyBzeXN0ZW1jdGwgc3RhcnQgbmdpbngKc3VkbyBzeXN0ZW1jdGwgZW5hYmxlIG5naW54"

    key_name = "Web1-Key_pair" # Replace with your key pair name
}

resource "aws_security_group" "node_app_sg" {
  name        = "node_app_sg"
  description = "Allow SSH and HTTP traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "instance_id" {
  value = aws_instance.node_app.id
}