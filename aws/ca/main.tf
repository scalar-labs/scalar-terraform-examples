module "ca" {
  source = "git::https://github.com/scalar-labs/scalar-terraform.git//modules/aws/ca?ref=v1.5.0"

  # Required Variables (Use remote state)
  network = local.network

  # Optional Variables
  ca = var.ca

  custom_tags = local.custom_tags
}
