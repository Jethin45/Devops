provider "aws" {
  region = "us-east-1"  # Choose your preferred AWS region
}

module "vpc" {
  source = "./modules/vpc"
}

resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  subnet_id     = module.vpc.public_subnets[0]
}
