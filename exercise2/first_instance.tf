provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "intro" {
  ami                    = "ami-0aa7d40eeae50c9a9"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  key_name               = "samplekey"
  vpc_security_group_ids = ["sg-02b3968d5d43bc0ca"]
  tags = {
    Name = "First instance"
  }
}