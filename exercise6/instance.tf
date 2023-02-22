resource "aws_key_pair" "test-key" {
  key_name   = "testkey"
  public_key = file("testkey.pub")
}

resource "aws_instance" "dove-web" {
  ami                    = var.AMIS[var.REGION]
  availability_zone      = var.ZONE1
  instance_type          = "t2.micro"
  subnet_id = aws_subnet.dove-pub-1.id
  key_name               = "testkey"
  vpc_security_group_ids = [aws_security_group.dove_stack_sg.id]
  tags = {
    Name = "First instance"
  }
  }

  resource "aws_ebs_volume" "vol_4_dove" {
  availability_zone = var.ZONE1
  size              = 3

  tags = {
    Name = "extra-vol-4-dove"
  }
}

resource "aws_volume_attachment" "atch_vol_dove" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.vol_4_dove.id
  instance_id = aws_instance.dove-web.id
}

output "publicIP" {
value = aws_instance.dove-web.public_ip
}
