base = "default" # bai, chiku, sho

scalardl = {
  # resource_type                       = "Standard_B2s"
  # resource_root_volume_size           = "64"
  # blue_resource_count                 = "3"
  # blue_image_tag                      = "2.1.0"
  # blue_image_name                     = "ghcr.io/scalar-labs/scalar-ledger"
  # blue_discoverable_by_envoy          = "true"
  # blue_enable_accelerated_networking  = "false"
  # green_resource_count                = "0"
  # green_image_tag                     = "2.1.0"
  # green_image_name                    = "ghcr.io/scalar-labs/scalar-ledger"
  # green_discoverable_by_envoy         = "false"
  # green_enable_accelerated_networking = "false"
  container_env_file = "example.scalardl_container.env"
  # enable_tdagent                      = "true"
  # cassandra_replication_factor        = "3"
}

envoy = {
  # resource_type                 = "Standard_B2s"
  # resource_count                = "3"
  # resource_root_volume_size     = "64"
  # listen_port                   = "50051"
  # privileged_listen_port        = "50052"
  # enable_nlb                    = "true"
  # nlb_internal                  = "true"
  # enable_tdagent                = "true"
  # key                           = ""
  # cert                          = ""
  # tag                           = "v1.14.1"
  # image                         = "envoyproxy/envoy"
  # tls                           = "false"
  # cert_auto_gen                 = "false"
  # custom_config_path            = ""
  # enable_accelerated_networking = "false"
}
