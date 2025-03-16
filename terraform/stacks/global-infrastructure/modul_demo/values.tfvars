container_cluster = {
  us-central1 = {
    cluster_name                  = "web-app-autopilot"
    enable_autopilot              = true
    enable_l4_ilb_subsetting      = true
    stack_type                    = "IPV4_IPV6"
    services_secondary_range_name = "services-range"
    cluster_secondary_range_name  = "pod-ranges"
    deletion_protection           = false
    auto_create_subnetworks       = false
    enable_ula_internal_ipv6      = true
    ip_cidr_range                 = "10.0.0.0/16"
    ipv6_access_type              = "EXTERNAL"
    secondary_ip_ranges = {
      services-range = {
        range_name    = "services-range"
        ip_cidr_range = "192.168.0.0/24"
      }
      pod-ranges = {
        range_name    = "pod-ranges"
        ip_cidr_range = "192.168.1.0/24"
      }
      services-range_2 = {
        range_name    = "services-range2"
        ip_cidr_range = "192.168.16.0/20"
      }
      pod-ranges_2 = {
        range_name    = "pod-ranges2"
        ip_cidr_range = "192.168.32.0/20"
      }
    }
    services_secondary_range_name = "services-range"
    cluster_secondary_range_name  = "pod-ranges"
  },
  us-east1 = {
    cluster_name                  = "web-app-autopilot"
    enable_autopilot              = true
    enable_l4_ilb_subsetting      = true
    stack_type                    = "IPV4_IPV6"
    services_secondary_range_name = "services-range"
    cluster_secondary_range_name  = "pod-ranges"
    deletion_protection           = false
    auto_create_subnetworks       = false
    enable_ula_internal_ipv6      = true
    ip_cidr_range                 = "10.0.0.0/16"
    ipv6_access_type              = "EXTERNAL"
    secondary_ip_ranges = {
      services-range = {
        range_name    = "services-range"
        ip_cidr_range = "192.168.0.0/24"
      }
      pod-ranges = {
        range_name    = "pod-ranges"
        ip_cidr_range = "192.168.1.0/24"
      }
      services-range_2 = {
        range_name    = "services-range2"
        ip_cidr_range = "192.168.16.0/20"
      }
      pod-ranges_2 = {
        range_name    = "pod-ranges2"
        ip_cidr_range = "192.168.32.0/20"
      }
    }
    services_secondary_range_name = "services-range"
    cluster_secondary_range_name  = "pod-ranges"
  }
}