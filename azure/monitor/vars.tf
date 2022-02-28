# General Settings
variable "base" {
  default = "default"
}

variable "monitor" {
  type    = map(string)
  default = {}
}

variable "targets" {
  type = tolist(string)
  default = [
    "cassandra",
    "scalardl",
  ]
}

# For Alerting Add Slack Webhook
variable "slack_webhook_url" {
  type    = string
  default = ""
}
