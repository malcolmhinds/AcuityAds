variable "db_name" {
    type = string
}

resource "aws_instance" "db" {
  ami = "ami-0db72f413fc1ddb2a"
  instance_type = "t2.micro"
  tags = {
    Name = var.db_name
  }
}

output "PrivateIP" {
    value = aws_instance.db.private_ip
}
