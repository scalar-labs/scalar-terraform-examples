module "scalardl" {
  source = "git@github.com:scalar-labs/scalar-terraform.git//modules/aws/scalardl?ref=1.2"

  # Required Variables (Use remote state)
  network   = local.network
  cassandra = local.cassandra

  # Optional Variables
  base     = var.base
  scalardl = var.scalardl
  envoy    = var.envoy

  custom_tags = local.custom_tags
}
