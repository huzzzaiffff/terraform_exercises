provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "intro" {
  ami                    = "ami-063d43db0594b521b"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  key_name               = "huz-key"
  vpc_security_group_ids = ["sg-0198281d80e5e2987"]
  tags = {
    Name = "Huz instance"
  }
}

