locals {
  network = {
    cidr      = data.terraform_remote_state.network.outputs.network_cidr
    name      = data.terraform_remote_state.network.outputs.network_name
    dns       = data.terraform_remote_state.network.outputs.dns_zone_id
    id        = data.terraform_remote_state.network.outputs.network_id
    region    = data.terraform_remote_state.network.outputs.region
    locations = join(",", data.terraform_remote_state.network.outputs.locations)

    image_id        = data.terraform_remote_state.network.outputs.image_id
    vm_os_publisher = data.terraform_remote_state.network.outputs.vm_os_publisher
    vm_os_offer     = data.terraform_remote_state.network.outputs.vm_os_offer
    vm_os_sku       = data.terraform_remote_state.network.outputs.vm_os_sku

    bastion_ip           = data.terraform_remote_state.network.outputs.bastion_ip
    bastion_provision_id = data.terraform_remote_state.network.outputs.bastion_provision_id

    public_key_path  = data.terraform_remote_state.network.outputs.public_key_path
    private_key_path = data.terraform_remote_state.network.outputs.private_key_path
    user_name        = data.terraform_remote_state.network.outputs.user_name
    internal_domain  = data.terraform_remote_state.network.outputs.internal_domain

    public_subnet_id  = data.terraform_remote_state.network.outputs.subnet_map["public"]
    private_subnet_id = data.terraform_remote_state.network.outputs.subnet_map["private"]
    blue_subnet_id    = data.terraform_remote_state.network.outputs.subnet_map["scalardl_blue"]
    green_subnet_id   = data.terraform_remote_state.network.outputs.subnet_map["scalardl_green"]
  }

  database = lookup(var.scalardl, "database", "cassandra")
}
