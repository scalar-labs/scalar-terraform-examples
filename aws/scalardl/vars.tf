# General Settings
variable "region" {
  default = "ap-northeast-1"
}

variable "base" {
  default = "default"
}

variable "scalardl" {
  type    = map(string)
  default = {}
}

variable "envoy" {
  type    = map(string)
  default = {}
}
