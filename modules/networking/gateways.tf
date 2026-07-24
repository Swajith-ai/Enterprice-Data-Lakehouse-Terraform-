#################################################
# Elastic IP for NAT Gateway
#################################################

resource "aws_eip" "nat" {

  domain = "vpc"

  tags = merge(
    var.common_tags,
    {
      Name = "${var.naming_prefix}-nat-eip"
    }
  )

}

#################################################
# NAT Gateway
#################################################

resource "aws_nat_gateway" "this" {

  allocation_id = aws_eip.nat.id

  subnet_id = aws_subnet.public[0].id

  tags = merge(
    var.common_tags,
    {
      Name = "${var.naming_prefix}-nat-gateway"
    }
  )

  depends_on = [
    aws_internet_gateway.this
  ]

}

