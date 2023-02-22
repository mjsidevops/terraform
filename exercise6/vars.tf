variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1a"
}

variable "ZONE2" {
  default = "us-east-1b"
}

variable "ZONE3" {
  default = "us-east-1c"
}

variable "MYIP" {
  default = "167.246.40.40/32"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-0aa7d40eeae50c9a9"
    us-east-2 = "ami-0aa7d40eeae50c9a9"
  }
}