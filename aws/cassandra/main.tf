module "cassandra" {
  source = "git::https://github.com/scalar-labs/scalar-terraform.git//modules/aws/cassandra?ref=v1.5.0"

  # Required Variables (Use network remote state)
  network = local.network

  # Optional Variables
  base      = var.base
  cassandra = var.cassandra
  cassy     = var.cassy
  reaper    = var.reaper

  custom_tags = local.custom_tags
}
