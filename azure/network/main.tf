module "network" {
  source = "git@github.com:scalar-labs/scalar-terraform.git//modules/azure/network?ref=v1.4.0"

  # Required Variables
  name             = var.name
  region           = var.region
  locations        = var.locations
  public_key_path  = var.public_key_path
  private_key_path = var.private_key_path
  internal_domain  = var.internal_domain

  # Optional Variables
  network                     = var.network
  additional_public_keys_path = var.additional_public_keys_path
}
