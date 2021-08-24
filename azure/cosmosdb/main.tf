module "cosmosdb" {
  source = "git::https://github.com/scalar-labs/scalar-terraform.git//modules/azure/cosmosdb?ref=master"

  # Required Variables
  network = local.network

  # Optional Variables
  allowed_subnet_ids            = local.allowed_subnet_ids
  allowed_cidrs                 = var.allowed_cidrs
  enable_virtual_network_filter = var.enable_virtual_network_filter
}
