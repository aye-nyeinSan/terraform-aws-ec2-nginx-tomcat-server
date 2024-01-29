resource "aws_security_group" "my_sg" {
  name        = "my_security_group"
  description = "security group for EC2 instance"
  vpc_id      = aws_vpc.main.id


  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  tags = {
    Name = "my_security_group"
  }
}

