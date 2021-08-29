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
    ssl_certificate_id = "arn:aws:acm:us-east-1:448051883053:certificate/047b160c-2074-43a0-b58e-4600b09d4b97"
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