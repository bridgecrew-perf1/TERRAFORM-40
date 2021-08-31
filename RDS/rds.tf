resource "aws_db_instance" "mysql-db" {

  identifier             = "mysqldb"
  instance_class         = "db.t3.medium"
  allocated_storage      = "20"
  engine                 = "mysql"
  engine_version         = "5.7.19"
  username               = var.username
  password               = var.password
  db_subnet_group_name   = "${aws_db_subnet_group.db_subnet.name}"
  vpc_security_group_ids = ["${aws_security_group.mysql-db.id}"]
  availability_zone      =  "${var.aws_region}${var.aws_region_az_02}"
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot         = "true"
  tags = {
         "name" = "mysql-rds"
        }  
        }