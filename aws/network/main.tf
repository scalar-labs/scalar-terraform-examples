module "network" {
  source = "git@github.com:scalar-labs/scalar-terraform.git//modules/aws/network?ref=1.3"

  # Required Variables
  name             = var.name
  locations        = var.locations
  public_key_path  = var.public_key_path
  private_key_path = var.private_key_path
  internal_domain  = var.internal_domain

  # Optional Variables
  network                     = var.network
  additional_public_keys_path = var.additional_public_keys_path
  custom_tags                 = var.custom_tags
}
