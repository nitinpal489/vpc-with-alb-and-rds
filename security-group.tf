#calling security group here with 80 port and outward traffic.

resource "aws_security_group" "allow_lb" {
  name        = "allow_lb"
  description = "Allow load balancer"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description      = "from vpc"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
   
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  tags = {
    Name = "allow lb_sg "
  }
}
