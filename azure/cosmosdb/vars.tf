# General Settings
variable "use_kubernetes" {
  type    = bool
  default = false
}

variable "is_virtual_network_filter_enabled" {
  type    = bool
  default = true
}

variable "allowed_cidrs" {
  type    = list(string)
  default = []
}
