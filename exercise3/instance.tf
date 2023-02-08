resource "aws_key_pair" "test-key" {
  key_name   = "testkey"
  public_key = file("testkey.pub")
}

resource "aws_instance" "testterraform" {
  ami                    = var.AMIS[var.REGION]
  availability_zone      = var.ZONE1
  instance_type          = "t2.micro"
  key_name               = "testkey"
  vpc_security_group_ids = ["sg-02b3968d5d43bc0ca"]
  tags = {
    Name = "First instance"
  }

  provisioner "file" {
    source      = "web1.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {
  
    inline = [
      "chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  connection {
    user        = "ec2-user"
    private_key = file("testkey")
    host        = self.public_ip
  }
}

