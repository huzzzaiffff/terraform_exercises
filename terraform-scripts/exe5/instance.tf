resource "aws_key_pair" "uo" {
  key_name   = "uo"
  public_key = file("uo.pub")
}

resource "aws_instance" "dove-inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.uo.key_name
  vpc_security_group_ids = ["sg-083f6cd9d05e271d7"]
  tags = {
    Name    = "Dove-Instancee"
    Project = "Dovee"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {

    inline = [
      "chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  connection {
    user        = var.USER
    private_key = file("uo")
    host        = self.public_ip
  }
}
