module "cosmosdb" {
  source = "git::https://github.com/scalar-labs/scalar-terraform.git//modules/azure/cosmosdb?ref=v1.5.0"

  # Required Variables
  network            = local.network
  allowed_subnet_ids = local.allowed_subnet_ids
}
