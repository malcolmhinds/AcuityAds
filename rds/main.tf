provider "aws" {
  region = "ca-central-1"
}

module "db" {
  source= "./db"
  server_names = ["mariadb","mysql","MSsql"]  
}

output "private_ip" {
  value = module.db.PrivateIP
}
