provider "aws" {
    region = "ca-central-1"
}

module "ec2module" {
  source = "./ec2"
  ec2name = "Name From Module"
}

output "moduyle _output" {
    value = moodule.ec2module.instance_id
}
