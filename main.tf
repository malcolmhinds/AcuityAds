provider "aws" {
    region = "ca-central-1"
}

module "db" {
  source = "./db"
  db_name = "DB Server"
}

module "web" {
  source = "./ec2"
  web_name = "Web Server"
}
    
module "eip" {
  source = "./eip"
}

module "sg" {
  source = "./sg"
}
output "PrivateIP" {
    value = moodule.db.PrivateIP
}

output "PublicIP" {
    value = moodule.web.Elastic_IP
}
