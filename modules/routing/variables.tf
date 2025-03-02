variable "vpc_id" {
  type = string
  description = "subnet vpc id"

  validation {
    error_message = "null vpc id"
    condition = length(var.vpc_id) > 0
  }
}

variable "private_subnet_id_1" {
    type = string
    description = "private subnet id"

}

variable "private_subnet_id_2" {
    type = string
    description = "private subnet id"

}

variable "private_subnet_id_3" {
    type = string
    description = "private subnet id"

}
  
variable "public_subnet_id_1" {
    type = string
    description = "private subnet id"

}

variable "public_subnet_id_2" {
    type = string
    description = "private subnet id"

}

variable "public_subnet_id_3" {
    type = string
    description = "private subnet id"

}
