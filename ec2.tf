data "aws_vpc" "existing" {
  filter {
    name   = "tag:Name"
    values = ["cmtr-n9nbj5cz-vpc"]
  }
}

data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.existing.id]
  }

  filter {
    name   = "tag:Name"
    values = ["cmtr-n9nbj5cz-public_subnet"]
  }
}

data "aws_subnet" "public" {
  id = data.aws_subnets.public.ids[0]
}

data "aws_security_group" "existing" {
  filter {
    name   = "group-name"
    values = ["cmtr-n9nbj5cz-sg"]
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.existing.id]
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "ec2" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t3.micro"
  subnet_id                   = data.aws_subnet.public.id
  vpc_security_group_ids      = [data.aws_security_group.existing.id]
  key_name                    = aws_key_pair.keypair.key_name
  associate_public_ip_address = true

  tags = {
    Name    = "${var.resource_prefix}-ec2"
    Project = var.project_tag
    ID      = var.id_tag
  }
}