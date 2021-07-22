provider "aws" {
  region = "ca-central-1"
}

resource "aws_db_instance" "myRDS" {
  name = "myDB"
  identifier = "my-first-rds"
  instance_class = "db.t2.micro"
  engine = "mariadb"
  engine_version = "10.2.21"
  username "bob"
  password = "password123"
  port = 3306
  skip_final_snapshot = true
}