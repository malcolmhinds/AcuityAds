provider "aws" {
  region = "ca-central-1"
}

#Variables for Dynamic Ports
variable "ingress" {
  type = list(number)
  default = [80,443]
}

variable "egress" {
  type = list(number)
  default = [80,443]
}
resource "aws_instance" "db" {
  ami = "ami-0db72f413fc1ddb2a"
  instance_type = "t2.micro"
  tags {
    Name = "DB Server"
  }
  security_groups = [aws_security_group.webtraffic.name]
}

resource "aws_instance" "web" {
  ami = "ami-0db72f413fc1ddb2a"
  instance_type = "t2.micro"
  user_data = file("server-script.sh")
  tags {
    Name = "Web Server"
  }
  security_groups = [aws_security_group.webtraffic.name]
}

resource "aws_eip" "elasticip" {
  instance = aws_instance.web.id
}

resource "aws_security_group" "webtraffic" {
  name = "Allow Web Traffic"
  
  dynamic "ingress" {
    iterator = port
    for_each - var.ingress
    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
  }
}
    dynamic "egress" {
    iterator = port
    for_each - var.egress
    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
  }
}

output "PrivateIP" {
  value = aws_instance.db.private_ip
}
  
output "PublicIP" {
  value = aws_eip.web_ip.public_ip
}
