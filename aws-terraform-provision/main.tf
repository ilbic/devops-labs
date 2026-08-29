# AWS config
# Secrets are handled in my environment so nothing is exposed to production.
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

# always need this step to allow ssh
data "aws_security_group" "existing" {
  id = "sg-02d526387f68a4865"
}

# initial key so ansible can remote on and do it's thing
resource "aws_key_pair" "judah" {
  key_name   = "judah"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "test_judah_sh" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.nano"
  key_name      = aws_key_pair.judah.key_name

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  vpc_security_group_ids = [
    data.aws_security_group.existing.id
  ]

  tags = {
    Name = "test.judah.sh"
  }
}

# generate an elastic IP and assign it to the ec2 instance
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

# Cloudflare config

# didn't want to hardcode/store zone id anywhere - instead, Terraform can discover info about my cloudflare itself

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

data "cloudflare_zone" "judah_sh" {

  filter = {
    name = "judah.sh"
  }
}

resource "cloudflare_dns_record" "test_judah_sh" {
  zone_id = data.cloudflare_zone.judah_sh.id
  name    = "test.judah.sh"
  ttl     = 1
  type    = "A"
  comment = "hello from terraform"
  content = aws_eip.test_judah_sh.public_ip
  proxied = true
}

# outputs to be returned to ansible + general context

output "test_judah_sh_public_ip" {
  value = aws_eip.test_judah_sh.public_ip
}