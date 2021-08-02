module "cosmosdb" {
  source = "git::https://github.com/scalar-labs/scalar-terraform.git//modules/azure/cosmosdb?ref=master"

  # Required Variables
  network = local.network

  # Optional Variables
  allowed_subnet_ids                = local.allowed_subnet_ids
  allowed_cidrs                     = var.allowed_cidrs
  is_virtual_network_filter_enabled = var.is_virtual_network_filter_enabled
}
