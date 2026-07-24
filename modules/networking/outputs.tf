#################################################
# VPC
#################################################

output "vpc_id" {

  description = "ID of the VPC."

  value = aws_vpc.this.id

}

#################################################
# Public Subnets
#################################################

output "public_subnet_ids" {

  description = "IDs of the public subnets."

  value = aws_subnet.public[*].id

}

#################################################
# Private Subnets
#################################################

output "private_subnet_ids" {

  description = "IDs of the private subnets."

  value = aws_subnet.private[*].id

}

#################################################
# Internet Gateway
#################################################

output "internet_gateway_id" {

  description = "ID of the Internet Gateway."

  value = aws_internet_gateway.this.id

}

#################################################
# NAT Gateway
#################################################

output "nat_gateway_id" {

  description = "ID of the NAT Gateway."

  value = aws_nat_gateway.this.id

}

#################################################
# Public Route Table
#################################################

output "public_route_table_id" {

  description = "ID of the public route table."

  value = aws_route_table.public.id

}

#################################################
# Private Route Table
#################################################

output "private_route_table_id" {

  description = "ID of the private route table."

  value = aws_route_table.private.id

}

