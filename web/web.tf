variable "web_name" {
  type = string
}

resource "aws_instance" "web" {
  ami = "ami-0db72f413fc1ddb2a"
  instance_type = "t2.micro"
  user_data = file("./web/server-script.sh")
  tags = {
    Name = var.web_name
  }
  security_groups = [module.sg.sg_name]
}

module "sg" {
  source = "../sg"
}

module "eip" {
  source = "../eip"
  instance_id = aws_instance.web.id
}

output "Elastic_IP" {
    value= module.eip.PublicIP
}
