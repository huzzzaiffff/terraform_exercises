resource "aws_instance" "huz-inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = "huz-key"
  vpc_security_group_ids = ["sg-0198281d80e5e2987"]
  tags = {
    Name    = "huz-ki-j"
    project = "huz"

  }
}
