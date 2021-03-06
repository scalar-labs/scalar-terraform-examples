module "scalardl" {
  source = "git::https://github.com/scalar-labs/scalar-terraform.git//modules/aws/scalardl?ref=master"

  # Required Variables (Use remote state)
  network = local.network

  # Optional Variables
  base     = var.base
  scalardl = var.scalardl
  envoy    = var.envoy

  custom_tags = local.custom_tags
}
