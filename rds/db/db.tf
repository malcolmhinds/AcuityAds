variable "server_names" {
    type = list(string)
}

resource "aws_instance" "db" {
  ami = "ami-0db72f413fc1ddb2a"
  instance_type = "t2.micro"
  count = length(var.server_names)
  tags = {
    Name = var.server_names[count.index]
  }
}

output "PrivateIP" {
    value = aws_instrance.db.*.private_ip
}