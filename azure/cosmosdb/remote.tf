data "terraform_remote_state" "network" {
  backend = "local"

  config = {
    path = "../network/terraform.tfstate"
  }
}

data "terraform_remote_state" "kubernetes" {
  count = var.use_kubernetes ? 1 : 0

  backend = "local"

  config = {
    path = "../kubernetes/terraform.tfstate"
  }
}
