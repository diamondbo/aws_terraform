variable "vpc_id" {
  type = string
  description = "subnet vpc id"

  validation {
    error_message = "null vpc id"
    condition = length(var.vpc_id) > 0
  }
}
variable "availability_zone" {
  type = string
  description = "subnet availability zone"

  validation {
    error_message = "null availability zone"
    condition = length(var.availability_zone) > 0
  }
}
variable "subnet_cidr_block" {
  type = string
  description = "subnet cidr"

  validation {
    error_message = "empty cidr"
    condition = length(var.subnet_cidr_block) > 0
  }
}
variable "is_public" {
  type = bool
  description = "determines if subnet is public"
}