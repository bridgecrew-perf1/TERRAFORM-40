#create-rt.tf
 
resource "aws_route_table" "rt-01" {
  vpc_id = aws_vpc.vpc.id
 
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-01.id
    
  }
 
  tags = {
    "Owner" = var.owner
    "Name"  = "${var.owner}-rt-01"
  }
 
}

resource "aws_route_table" "private-rt-01" {
  vpc_id = aws_vpc.vpc.id
 
  route {
    cidr_block = var.rt_cidr_block
    nat_gateway_id = aws_nat_gateway.nat-gw.id

  }
 
  tags = {
    "Owner" = var.owner
    "Name"  = "${var.owner}-rt-02"
  }
 
}



