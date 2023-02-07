resource "aws_instance" "testterraform" {
  ami                    = var.AMIS[var.REGION]
  availability_zone      = var.ZONE1
  instance_type          = "t2.micro"
  key_name               = "samplekey"
  vpc_security_group_ids = ["sg-02b3968d5d43bc0ca"]
  tags = {
    Name = "First instance"
  }
}