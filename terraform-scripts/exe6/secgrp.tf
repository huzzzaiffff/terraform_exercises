resource "aws_security_group" "huz_stack_sg" {
  vpc_id      = aws_vpc.huzaif-vpc.id    # The VPC ID where this security group will be applied.
  name        = "huz-stack-sg"           # Security group name.
  description = "Sec Grp for huzaif ssh" # A description for this security group.

  egress {
    from_port   = 0             # Starting port for egress rules (outbound traffic).
    to_port     = 0             # Ending port for egress rules (outbound traffic).
    protocol    = "-1"          # Protocol set to "-1" allows all protocols.
    cidr_blocks = ["0.0.0.0/0"] # Allows outbound traffic to any IP.
  }

  ingress {
    from_port   = 22         # Starting port for ingress (inbound) traffic.
    to_port     = 22         # Ending port for ingress traffic.
    protocol    = "tcp"      # Protocol set to "tcp" for SSH traffic.
    cidr_blocks = [var.MYIP] # Restricts SSH access to the user's IP address only.
  }

  tags = {
    Name = "allow-ssh" # Tag to identify this security group in AWS.
  }
}

