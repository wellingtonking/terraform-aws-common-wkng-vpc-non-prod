variable "region" {
  default     = "us-east-1"
  description = "The AWS region, default is \"us-east-1\"."
}

variable "vpc_name" {
  default     = "non-prod"
  description = "The VPC name, default is \"non-prod\"."
}

variable "vpc_cidr_block" {
  default     = "10.0.0.0/16"
  description = "The VPC CIDR, must be unique, default is \"10.0.0.0/16\"."
}

variable "ig_name" {
  default     = "ig-non-prod"
  description = "The Internet Gateway name, default is \"ig-non-prod\"."
}

variable "subnet_public" {
  default = [
    {
      cidr_block        = "10.0.128.0/23"
      availability_zone = "us-east-1a"
      name              = "public-on-prod-a"
    },
    {
      cidr_block        = "10.0.130.0/23"
      availability_zone = "us-east-1b"
      name              = "public-on-prod-b"
    },
    {
      cidr_block        = "10.0.132.0/23"
      availability_zone = "us-east-1c"
      name              = "public-on-prod-c"
    }
  ]
}

variable "subnet_backend" {
  default = [
    {
      cidr_block        = "10.0.64.0/23"
      availability_zone = "us-east-1a"
      name              = "backend-on-prod-a"
    },
    {
      cidr_block        = "10.0.80.0/23"
      availability_zone = "us-east-1b"
      name              = "backend-on-prod-b"
    },
    {
      cidr_block        = "10.0.96.0/23"
      availability_zone = "us-east-1c"
      name              = "backend-on-prod-c"
    }
  ]
}

variable "subnet_frontend" {
  default = [
    {
      cidr_block        = "10.0.0.0/23"
      availability_zone = "us-east-1a"
      name              = "frontend-on-prod-a"
    },
    {
      cidr_block        = "10.0.16.0/23"
      availability_zone = "us-east-1b"
      name              = "frontend-on-prod-b"
    },
    {
      cidr_block        = "10.0.32.0/23"
      availability_zone = "us-east-1c"
      name              = "frontend-on-prod-c"
    }
  ]
}

variable "route_table_public_name" {
  default     = "rt-public-non-prod"
  description = "The public subnets route table name, default is \"rt-public-non-prod\"."
}