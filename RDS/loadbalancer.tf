resource "aws_elb" "pythonelb" {
  name               = "python-terraform-elb"
#  availability_zones = ["${var.aws_region}${var.aws_region_az_01}, ${var.aws_region}${var.aws_region_az_02}"]
  subnets = [aws_subnet.subnet-01.id]
  security_groups = [aws_security_group.elb-sg.id]


  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  listener {
    instance_port      = 80
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = "arn:aws:acm:us-east-1:055413830351:certificate/f8578ed6-b6c0-43a1-afb2-f817262510a8"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/ping"
   
    interval            = 30
  }
  
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "python-elb"
  }
}

resource "aws_elb_attachment" "elbattach" {
  elb      = aws_elb.pythonelb.id
  instance = aws_instance.instance.id
}