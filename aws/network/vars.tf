# General Settings
variable "region" {
  default = "ap-northeast-1"
}

variable "base" {
  default = "default"
}

variable "name" {}

variable "locations" {
  type = list(string)
}

variable "public_key_path" {}

variable "private_key_path" {}

variable "additional_public_keys_path" {
  default = ""
}

variable "internal_domain" {}

variable "network" {
  type    = map(string)
  default = {}
}

variable "custom_tags" {
  type    = map(string)
  default = {}
}
