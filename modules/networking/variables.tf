#################################################
# VPC Configuration
#################################################

variable "vpc_cidr" {

  description = "CIDR block for the VPC."

  type = string

}

#################################################
# Public Subnets
#################################################

variable "public_subnet_cidrs" {

  description = "CIDR blocks for public subnets."

  type = list(string)

}

#################################################
# Private Subnets
#################################################

variable "private_subnet_cidrs" {

  description = "CIDR blocks for private subnets."

  type = list(string)

}

#################################################
# Availability Zones
#################################################

variable "availability_zones" {

  description = "Availability Zones."

  type = list(string)

}

#################################################
# Naming Prefix
#################################################

variable "naming_prefix" {

  description = "Common naming prefix."

  type = string

}

#################################################
# Common Tags
#################################################

variable "common_tags" {

  description = "Common resource tags."

  type = map(string)

}

