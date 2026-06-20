variable "aws_region" {
  description = "AWS region where resources will be deployed."
  type        = string
  default     = "eu-south-2"
}

variable "ssh_cidr" {
  description = "CIDR block allowed to connect via SSH to the EC2 instance."
  type        = string
  default     = "185.71.137.32/32"

  validation {
    condition     = can(cidrhost(var.ssh_cidr, 0))
    error_message = "The ssh_cidr variable must be a valid CIDR block."
  }
}

variable "aws_ami" {
  description = "AMI ID to use for the EC2 instance."
  type        = string
  default     = "ami-0148251f3f228d827"

  validation {
    condition     = can(regex("^ami-[a-f0-9]+$", var.aws_ami))
    error_message = "The aws_ami variable must be a valid AMI ID (e.g. ami-0abc123def456)."
  }
}

variable "aws_instance_type" {
  description = "Instance type to use for the EC2 instance."
  type        = string
  default     = "t3.micro"

  validation {
    condition     = contains(["t3.micro", "t3.nano"], var.aws_instance_type)
    error_message = "The aws_instance_type variable must be either 't3.micro' or 't3.nano'."
  }
}

variable "aws_key_name" {
  description = "Name of the AWS Key Pair to associate with the EC2 instance."
  type        = string
  default     = "key-pair"

  validation {
    condition     = length(var.aws_key_name) > 0
    error_message = "The aws_key_name variable must not be empty."
  }
}
