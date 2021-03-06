# General Settings
variable "region" {
  default = "ap-northeast-1"
}

variable "network" {
  type    = map(string)
  default = {}
}

variable "kubernetes_cluster" {
  type    = map(string)
  default = {}
}

variable "kubernetes_node_groups" {
  type = any
  default = {
    default_node_pool = {}
    scalar_apps_pool  = {}
  }
}

variable "custom_tags" {
  type    = map(string)
  default = {}
}
