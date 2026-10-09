resource "aws_key_pair" "keypair" {
  key_name   = "${var.resource_prefix}-keypair"
  public_key = var.ssh_key

  tags = {
    Project = var.project_tag
    ID      = var.id_tag
  }
}