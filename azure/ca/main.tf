module "ca" {
  source = "git::https://github.com/scalar-labs/scalar-terraform.git//modules/azure/ca?ref=upgrade/k8s_version"

  # Required Variables (Use remote state)
  network = local.network

  # Optional Variables
  ca = var.ca
}
