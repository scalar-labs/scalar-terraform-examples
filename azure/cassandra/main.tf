module "cassandra" {
  source = "git@github.com:scalar-labs/scalar-terraform.git//modules/azure/cassandra?ref=1.2"

  # Required Variables (Use network remote state)
  network = local.network

  # Optional Variables
  base      = var.base
  cassandra = var.cassandra
  cassy     = var.cassy
  reaper    = var.reaper
}
