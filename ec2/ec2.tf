variable "ec2name" {
    type = string
}

resource "aws_instance" "ec2" {
  ami = "ami-0db72f413fc1ddb2a"
  instance_type = "t2.micro"
  tags = {
    Name = "var.ec2name"
  }
}
