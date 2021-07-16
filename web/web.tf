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

module "sg" {
  source = "../sg"
  sg_name = "Allow Web Traffic"
}

module "eip" {
  source = "../eip"
   instance_id = aws_instance.web.id
}

output "web_output" {
    value = moodule.ec2module.instance_id
}
