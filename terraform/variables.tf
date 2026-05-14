variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-2"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "Ubuntu AMI ID"
  type        = string
  default     = "ami-0aab712d6363da7f9"
}

variable "key_pair_name" {
  description = "AWS EC2 key pair name"
  type        = string
  default     = "statuspulse-key"
}

variable "allowed_ssh_cidr" {
  description = "Allowed SSH CIDR blocks"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}