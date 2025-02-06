resource "aws_instance" "expense" {
  count = length(var.instances) 
  ami                    = "ami-09c813fb71547fc4f"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type          = "t3.micro"
  /* tags = {
    Name    = var.instances[count.index]
    Purpose = "terraform-practice"
  } */
  tags = merge(
    var.common_tags,
    {
      Name = "${var.project}-${var.environment}-${var.instances[count.index]}"
    }

  )
}

resource "aws_security_group" "allow_tls" {
  name        = "${var.project}-${var.environment}"
  description = "Allow TLS inbound traffic and all outbound traffic"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }



  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }



  tags = {
    Name = "${var.project}-${var.environment}"
  }
}