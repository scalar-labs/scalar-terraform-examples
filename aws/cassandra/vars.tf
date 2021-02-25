# General Settings
variable "region" {
  default = "ap-northeast-1"
}

variable "base" {
  default = "default"
}

variable "cassandra" {
  type    = map(string)
  default = {}
}

variable "cassy" {
  type    = map(string)
  default = {}
}

variable "reaper" {
  type    = map(string)
  default = {}
}
