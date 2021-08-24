locals {
  network = {
    name   = data.terraform_remote_state.network.outputs.network_name
    region = data.terraform_remote_state.network.outputs.region
  }

  allowed_subnet_ids = var.use_kubernetes ? [data.terraform_remote_state.kubernetes[0].outputs.node_pool_subnet_id] : [
    data.terraform_remote_state.network.outputs.subnet_map["scalardl_blue"],
    data.terraform_remote_state.network.outputs.subnet_map["scalardl_green"]
  ]
}
