module "ca" {
  # source = "git@github.com:scalar-labs/scalar-terraform.git//modules/aws/ca?ref=1.2"
  source = "../../../modules/aws/ca"

  # Required Variables (Use remote state)
  network = local.network

  # Optional Variables
  ca = var.ca

  custom_tags = local.custom_tags
}
