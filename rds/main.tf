provider "aws" {
  region = "ca-central-1"
}

module "db" {
  source= "../Challenge3/db"
  servce_names = ["mariadb","mysql","MSsql"]
  
}
