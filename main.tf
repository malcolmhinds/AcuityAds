provider "aws" {
  region = "ca-central-1"
}

resource "aws_instance" "ec2" {
  ami = "ami-0db72f413fc1ddb2a"
  instance_type = "t2.micro"
}

resource "aws_eip" "elasticip" {
  instance = aws_instance.ec2.id
}

output "EIP" {
  value = aws_eip.elasticip.public_ip
}

resource "aws_vpc" "myvpc" {
   value
}
