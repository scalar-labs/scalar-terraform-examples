# General Settings
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
