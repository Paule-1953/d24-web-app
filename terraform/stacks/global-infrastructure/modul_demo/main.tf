module "container_cluster_network" {
  source = "../../../modules/container_cluster_network"

  for_each = var.container_cluster

  cluster_name                  = "${each.value.cluster_name}-${each.key}"
  location                      = each.key
  enable_autopilot              = each.value.enable_autopilot
  enable_l4_ilb_subsetting      = each.value.enable_l4_ilb_subsetting
  stack_type                    = each.value.stack_type
  deletion_protection           = each.value.deletion_protection
  auto_create_subnetworks       = each.value.auto_create_subnetworks
  enable_ula_internal_ipv6      = each.value.enable_ula_internal_ipv6
  ip_cidr_range                 = each.value.ip_cidr_range
  ipv6_access_type              = each.value.ipv6_access_type
  secondary_ip_ranges           = each.value.secondary_ip_ranges
  services_secondary_range_name = each.value.services_secondary_range_name
  cluster_secondary_range_name  = each.value.cluster_secondary_range_name


  # cluster_name                  = var.cluster_name
  # location                      = var.location
  # enable_autopilot              = var.enable_autopilot
  # enable_l4_ilb_subsetting      = var.enable_l4_ilb_subsetting
  # stack_type                    = var.stack_type
  # deletion_protection           = var.deletion_protection
  # auto_create_subnetworks       = var.auto_create_subnetworks
  # enable_ula_internal_ipv6      = var.enable_ula_internal_ipv6
  # ip_cidr_range                 = var.ip_cidr_range
  # ipv6_access_type              = var.ipv6_access_type
  # secondary_ip_ranges           = var.secondary_ip_ranges
  # services_secondary_range_name = var.services_secondary_range_name
  # cluster_secondary_range_name  = var.cluster_secondary_range_name

}