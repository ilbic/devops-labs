provider "aws" {
  region = "eu-west-2"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "test_judah_sh" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.nano"

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }
  
  tags = {
    Name = "test.judah.sh"
  }
}

resource "aws_eip" "test_judah_sh" {
  domain = "vpc"

  tags = {
    Name = "test.judah.sh"
  }
}

resource "aws_eip_association" "test_judah_sh" {
  instance_id   = aws_instance.test_judah_sh.id
  allocation_id = aws_eip.test_judah_sh.id
}