# Configure the AWS Provider
provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAXN5XSS2XRE76KXA7"
  secret_key = "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"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "instace_aws_mcatalan" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "Instace aws mcatalan"
  }
}

