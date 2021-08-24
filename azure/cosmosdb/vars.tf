# General Settings
variable "use_kubernetes" {
  type    = bool
  default = false
}

variable "enable_virtual_network_filter" {
  type    = bool
  default = true
}

variable "allowed_cidrs" {
  type    = list(string)
  default = []
}
