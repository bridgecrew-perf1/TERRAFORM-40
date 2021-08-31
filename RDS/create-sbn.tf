#create-sbn-01.tf
 
resource "aws_subnet" "subnet-01" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = var.sbn_public_ip
  availability_zone       = "${var.aws_region}${var.aws_region_az_01}"


  tags = {
    "Owner" = var.owner
    "Name"  = "${var.owner}-subnet-01"
    "Type"  = "public-subnet"
  }
}
 resource "aws_route_table_association" "rt-01" {
  subnet_id      = aws_subnet.subnet-01.id
  route_table_id = aws_route_table.rt-01.id
}

# #create-sbn-02.tf
 
resource "aws_subnet" "subnet-02" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = var.sbn_public_ip
  availability_zone       = "${var.aws_region}${var.aws_region_az_02}"
####  route_table_id          =  ""

  tags = {
    "Owner" = var.owner
    "Name"  = "${var.owner}-subnet-02"
    "Type"  = "public-subnet"
  }
}
resource "aws_route_table_association" "rt-02" {
  subnet_id      = aws_subnet.subnet-02.id
  route_table_id = aws_route_table.rt-01.id
}

resource "aws_subnet" "private-subnet-01" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "${var.aws_region}${var.aws_region_az_01}"
  tags = {
    "Owner" = var.owner
    "Name"  = "${var.owner}-subnet-02"
    "Type"  = "private-subnet-01"
  }
}
resource "aws_route_table_association" "rt-03" {
  subnet_id      = aws_subnet.private-subnet-01.id
  route_table_id = aws_route_table.private-rt-01.id
}

resource "aws_subnet" "private-subnet-02" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "${var.aws_region}${var.aws_region_az_02}"
  tags = {
    "Owner" = var.owner
    "Name"  = "${var.owner}-subnet-02"
    "Type"  = "private-subnet-02"
  }
}
resource "aws_route_table_association" "rt-04" {
  subnet_id      = aws_subnet.private-subnet-02.id
  route_table_id = aws_route_table.private-rt-01.id
}


####db subnet group
resource "aws_db_subnet_group" "db_subnet" {
  name       = "dbmain"
  subnet_ids = ["${aws_subnet.private-subnet-01.id}", "${aws_subnet.private-subnet-02.id}"]

  tags = {
    Name = "My DB subnet group"
  }
}

