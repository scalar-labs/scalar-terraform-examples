# General Settings
variable "region" {
  default = "ap-northeast-1"
}

variable "base" {
  default = "default"
}

variable "cassandra" {
  type    = map(any)
  default = {}
}

variable "cassy" {
  type    = map(any)
  default = {}
}

variable "reaper" {
  type    = map(any)
  default = {}
}
