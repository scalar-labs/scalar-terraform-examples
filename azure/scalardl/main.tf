module "scalardl" {
  source = "git@github.com:scalar-labs/scalar-terraform.git//modules/azure/scalardl?ref=1.4"

  # Required Variables (Use remote state)
  network   = local.network
  cassandra = local.cassandra

  # Optional Variables
  base     = var.base
  scalardl = var.scalardl
  envoy    = var.envoy
}
