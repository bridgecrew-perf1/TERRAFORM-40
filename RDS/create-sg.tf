# create-sg.tf
 
data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}
 
resource "aws_security_group" "test" {
  
#   name          = "sg"
  description = "Allow inbound traffic via SSH"
  vpc_id      = aws_vpc.vpc.id
  
 
  ingress  {
    description      = "My public IP"
    protocol         = var.sg_ingress_proto
    from_port        = var.sg_ingress_ssh
    to_port          = var.sg_ingress_ssh
    cidr_blocks      = ["${chomp(data.http.myip.body)}/32"]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
   # security_groups  = ["${aws_security_group.elb-sg.id}"]
    self             = false
 
  }

  ingress  {
    description      = "My public IP"
    protocol         = var.sg_ingress_proto
    from_port        = var.sg_ingress_80
    to_port          = var.sg_ingress_80
    
    security_groups = ["${aws_security_group.elb-sg.id}"]
    cidr_blocks      = []
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    self             = false
 
  }
  
 
 
  egress = [{
    description      = "All traffic"
    protocol         = var.sg_egress_proto
    from_port        = var.sg_egress_all
    to_port          = var.sg_egress_all
    cidr_blocks      = [var.sg_egress_cidr_block]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
 
  }]
 
  tags = {
    "Owner" = var.owner
    "Name"  = "${var.owner}-ec2-sg"
  }
}



############db sg ####temp
resource "aws_security_group" "db_sg" {
    name = "db_sg"
    description = "Allow RDP to  host"
    vpc_id = "${aws_vpc.vpc.id}"
}

resource "aws_security_group" "mysql-db" {
  description = "Allow inbound traffic for mysql 3306 in vpc"
  vpc_id      = aws_vpc.vpc.id
    ingress  {
    description      = "My public IP"
    protocol         = var.sg_ingress_proto
    from_port        = var.sg_ingress_mysql
    to_port          = var.sg_ingress_mysql
    cidr_blocks      = [aws_vpc.vpc.cidr_block]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
 
  }

 
  egress = [{
    description      = "All traffic"
    protocol         = var.sg_egress_proto
    from_port        = var.sg_egress_all
    to_port          = var.sg_egress_all
    cidr_blocks      = [var.sg_egress_cidr_block]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
 
  }]
 
  tags = {
    "Owner" = var.owner
    "Name"  = "${var.owner}-mysql-db-sg"
  }
}
##################### ELB SECURITY GROUP

resource "aws_security_group" "elb-sg" {
  description = "Allow 443/http traffic via elb"
  vpc_id      = aws_vpc.vpc.id
  
 
  ingress = [
  {
    description      = "My public IP"
    protocol         = var.sg_ingress_proto
    from_port        = var.sg_ingress_443
    to_port          = var.sg_ingress_443
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
 
  }
  ]
 
 
  egress = [{
    description      = "All traffic"
    protocol         = var.sg_egress_proto
    from_port        = var.sg_egress_all
    to_port          = var.sg_egress_all
    cidr_blocks      = [var.sg_egress_cidr_block]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
 
  }]
 
  tags = {
    "Owner" = var.owner
    "Name"  = "${var.owner}-elb-sg"
  }
}