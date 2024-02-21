variable "region" {
  description = "The AWS region to create the VPC in"
  type        = string
}

variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "A list of public subnet CIDR blocks"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "A list of private subnet CIDR blocks"
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "availability_zones" {
  description = "List of availability zones in the region"
  type        = list(string)
}

variable "environment_name" {
  description = "The name of the environment"
  type        = string
}