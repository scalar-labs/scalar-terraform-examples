module "cassandra" {
  # source = "git@github.com:scalar-labs/scalar-terraform.git//modules/azure/cassandra?ref=v1.0.0"
  source = "../../../modules/azure/cassandra"

  # Required Variables (Use network remote state)
  network = local.network

  # Optional Variables
  base      = var.base
  cassandra = var.cassandra
  cassy     = var.cassy
  reaper    = var.reaper
}
