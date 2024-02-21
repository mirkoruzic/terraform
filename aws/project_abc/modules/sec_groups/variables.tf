variable "vpc_id" {
  description = "The ID of the VPC where the security group will be created"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for the security group name"
  type        = string
}

variable "ingress_rules" {
  description = "List of maps containing the ingress rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}

variable "egress_rules" {
 description = "List of maps containing the egress rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}

variable "tags" {
  description = "A map of tags to add to the security group"
  type        = map(string)
  default     = {}
}