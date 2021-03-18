region = "ap-northeast-1"

base = "default" # bai, chiku, sho

scalardl = {
  # resource_type                = "t3.medium"
  # resource_root_volume_size    = "64"
  # blue_resource_count          = "3"
  # blue_image_tag               = "2.1.0"
  # blue_image_name              = "ghcr.io/scalar-labs/scalar-ledger"
  # blue_discoverable_by_envoy   = "true"
  # blue_container_env_file      = "scalardl_blue_container.env"
  # green_resource_count         = "0"
  # green_image_tag              = "2.1.0"
  # green_image_name             = "ghcr.io/scalar-labs/scalar-ledger"
  # green_discoverable_by_envoy  = "false"
  # green_container_env_file     = "scalardl_green_container.env"
  # port                         = "50051"
  # privileged_port              = "50052"
  # enable_tdagent               = "true"
  # cassandra_replication_factor = "3"
}

envoy = {
  # resource_type             = "t3.medium"
  # resource_count            = "3"
  # resource_root_volume_size = "64"
  # target_port               = "50051"
  # privileged_target_port    = "50052"
  # listen_port               = "50051"
  # privileged_listen_port    = "50052"
  # enable_nlb                = "true"
  # nlb_internal              = "true"
  # enable_tdagent            = "true"
  # key                       = ""
  # cert                      = ""
  # tag                       = "v1.14.1"
  # image                     = "envoyproxy/envoy"
  # tls                       = "false"
  # cert_auto_gen             = "true"
  # custom_config_path        = ""
}
