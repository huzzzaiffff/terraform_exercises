resource "aws_key_pair" "ip" {
  key_name   = "ip"
  public_key = file(var.PUB_KEY)
}

resource "aws_instance" "huz-web" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.huz-pub-1.id
  key_name               = aws_key_pair.ip.key_name
  vpc_security_group_ids = [aws_security_group.huz_stack_sg.id]
  tags = {
    Name = "my-huz"
  }
}

resource "aws_ebs_volume" "vol_4_huz" {
  availability_zone = var.ZONE1
  size              = 3
  tags = {
    Name = "extr-vol-4-huz"
  }
}

resource "aws_volume_attachment" "atch_vol_huz" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.vol_4_huz.id
  instance_id = aws_instance.huz-web.id
}

output "PublicIP" {
  value = aws_instance.huz-web.public_ip
}
