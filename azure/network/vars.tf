# General Settings
variable "name" {}

variable "base" {
  default = "default"
}

variable "region" {
  default = "japaneast"
}

variable "locations" {
  type    = tolist(string)
  default = []
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

variable "use_cosmosdb" {
  type        = bool
  default     = false
  description = "Whether to use Cosmos DB. If true, a service endpoint for Cosmos DB is enabled."
}
