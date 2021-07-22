provider "aws" {
  region = "ca-central-1"
}

module "db" {
  source= "./db"
  servce_names = ["mariadb","mysql","MSsql"]
  
}
