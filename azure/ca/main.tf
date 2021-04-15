module "ca" {
  source = "git@github.com:scalar-labs/scalar-terraform.git//modules/azure/ca?ref=1.3"

  # Required Variables (Use remote state)
  network = local.network

  # Optional Variables
  ca = var.ca
}
