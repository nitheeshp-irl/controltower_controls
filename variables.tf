variable "aws_region" {
  description = "The AWS region to use"
  type        = string
}

variable "controls" {
  description = "List of controls and their associated organizational unit names"
  type = list(object({
    control_names          = list(string)
    organizational_unit_names = list(string)
  }))
}