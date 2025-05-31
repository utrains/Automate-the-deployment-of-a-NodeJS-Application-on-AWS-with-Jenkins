# ~~~~~~~~~~~ Security group for the Backend LoadBalancer ~~~~~~~~~~

resource "aws_security_group" "backend_sg" {

  name        = "${var.backend_app_name}-sg"
  description = "Security group for ${var.backend_app_name} ecs"
  vpc_id      = module.vpc.vpc_id
  ingress {
    description = "allows inbound fron the front end"
    from_port   = var.backend_port
    to_port     = var.backend_port
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
    Name = "${var.backend_app_name}-sg"
  }
}