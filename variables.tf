variable "ssh_key" {
  description = "Provides custom public SSH key."
  type        = string
  sensitive   = true
}

variable "aws_region" {
  description = "AWS region in which resources will be created."
  type        = string
}

variable "resource_prefix" {
  description = "Prefix used to construct resource names."
  type        = string
}

variable "project_tag" {
  description = "Project tag applied to created resources."
  type        = string
}

variable "id_tag" {
  description = "ID tag applied to created resources."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type used to launch the instance."
  type        = string
}