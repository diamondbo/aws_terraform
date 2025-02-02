variable "cidr_block" {
  default = "10.0.0.0/16"
  type = string
  description = "main k3 vpc"

  validation {
    error_message = "empty cidr"
    condition = length(var.cidr_block) > 0
  }
}
