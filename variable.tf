variable "ami_id" {
  description = "The AMI ID for the EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the EC2 instances"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The name of the key pair to use for the instances"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_1_cidr" {
  description = "The CIDR block for the first public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_2_cidr" {
  description = "The CIDR block for the second public subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "availability_zone_1" {
  description = "The availability zone for the first public subnet"
  type        = string
  default     = "ap-southeast-2a"
}

variable "availability_zone_2" {
  description = "The availability zone for the second public subnet"
  type        = string
  default     = "ap-southeast-2b"
}