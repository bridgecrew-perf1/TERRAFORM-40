resource "aws_db_instance" "mysql-db" {
     identifier                 = "mysqldatabase"
	 storage_type                = "gp2"
	 allocated_storage           = "20"
     engine                      = "mysql"
     engine_version              = "5.7.24"
     instance_class              = "t3.medium"
     port                        = "3306"
     vpc_security_group_ids      = ["${aws_security_group.test.id}"]
     db_subnet_group_name        = "${aws_db_subnet_group.db_subnet.name}"
     name                        = "mysqldb"
     username                    = "var.username"
     password                    =  "var.password"
     parameter_group_name        = "default.mysql5.7"
     availability_zone           =  "${var.aws_region}${var.aws_region_az_02}"
     deletion_protection         = "true"
     skip_final_snapshot         = "false"

     tags = {
         "name" = "mysql-rds"
              }


}
