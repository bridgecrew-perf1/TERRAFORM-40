# create-igw.tf
 
resource "aws_internet_gateway" "igw-01" {
  vpc_id = aws_vpc.vpc.id
 
  tags = {
    "Owner" = var.owner
    "Name"  = "${var.owner}-igw-01"
  }
}

# resource "aws_internet_gateway" "igw-02" {
#   vpc_id = aws_vpc.vpc.id
 
#   tags = {
#     "Owner" = var.owner
#     "Name"  = "${var.owner}-igw-02"
#   }
# }