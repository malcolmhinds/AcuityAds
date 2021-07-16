variable "web_name" {
  type = string
}

resource "aws_instance" "web" {
  ami = "ami-0db72f413fc1ddb2a"
  instance_type = "t2.micro"
  user_data = file("server-script.sh")
  tags = {
    Name = "Web Server"
  }
  security_groups = [aws_security_group.webtraffic.name]
}
