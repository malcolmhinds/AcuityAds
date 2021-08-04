provider "aws" {
    region = "ca-central-1"
}

resource "aws_instance" "ec2Instance" {
    ami = "ami-0db72f413fc1ddb2a"
    instance_type = "t2.micro"
    tags = {
        Name = "Terraform EC2"
        Environment = "Dev"
    }
    security_groups = [aws_security_group.allow_TLS.name]
}

resource "aws_security_group" "allow_TLS"{
    name = "allow-tls"
    ingress {
        from_port = "443"
        to_port = "443"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
        egress {
        from_port = "443"
        to_port = "443"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

module "dbserver" {
    source = "./db"
    dbname = "mydbserver"
}


variable "vpcname" {
    type = string
    default = "myvpc"
}

variable "sshport" {
    type = number
    default = 22
}

variable "enabled" {
    default = true
}

variable "mylist" {
    type = list(number)
    default = [1,2,3,4]
}

variable "mymap" {
    type = map
    default =  {
        key1 = ""


    }
}