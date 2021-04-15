module "monitor" {
  source = "git@github.com:scalar-labs/scalar-terraform.git//modules/azure/monitor?ref=1.3"

  # Required Variables (Use remote state)
  network   = local.network
  cassandra = local.cassandra
  scalardl  = local.scalardl

  # Optional Variables
  base    = var.base
  monitor = var.monitor
  targets = var.targets

  slack_webhook_url = var.slack_webhook_url
}
