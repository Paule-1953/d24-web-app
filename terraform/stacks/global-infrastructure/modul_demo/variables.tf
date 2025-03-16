variable "container_cluster" {
  type = map(object({
    cluster_name                  = string
    enable_autopilot              = bool
    enable_l4_ilb_subsetting      = bool
    stack_type                    = string
    services_secondary_range_name = string
    cluster_secondary_range_name  = string
    deletion_protection           = bool
    auto_create_subnetworks       = bool
    enable_ula_internal_ipv6      = bool
    ip_cidr_range                 = string
    ipv6_access_type              = string
    secondary_ip_ranges = map(object({
      range_name    = string
      ip_cidr_range = string
    }))
  }))

  description = <<EOF
  It acts like a container with that you can create multiple cluster in different locations.
  The keys of the map should be the geo-code-mapping of the location in which the service shall be installed:
  https://cloud.google.com/about/locations
  
  The value is an object with the following attributes:
    - cluster_name:
        The name of the cluster.
        e.g. web-app-autopilot-cluster
    - location:
        The location (region) of the cluster.
        e.g. europe-west3
    - enable_autopilot:
        Enable Autopilot mode for the cluster.
    - enable_l4_ilb_subsetting:
        Enable L4 ILB subsetting for the cluster.
    - stack_type:
        The stack type of the cluster. Possible values are: IPV4, IPV6, IPV4_IPV6.
    - services_secondary_range_name:
        The name of the existing secondary range in the cluster's subnetwork to use for service ClusterIPs.
        Alternatively, services_ipv4_cidr_block can be used to automatically create
        a GKE-managed one.
    - cluster_secondary_range_name:
        The name of the existing secondary range in the cluster's subnetwork to use for pod IP addresses.
        Alternatively, cluster_ipv4_cidr_block can be used to automatically create
        a GKE-managed one.
    - deletion_protection:
        Whether Terraform will be prevented from destroying the cluster.
        Deleting this cluster via terraform destroy or terraform apply will only succeed if this field is false in the Terraform state.
    - auto_create_subnetworks:
        When set to true, the VPC network is created in auto mode.
        When set to false, the VPC network is created in custom mode.
        Defaults to true.
    - enable_ula_internal_ipv6:
        Enable IPv6 for this network.
        If this field is set to true, the network is created with an IPv6 CIDR range.
        This field can only be set for custom subnets.
    - ip_cidr_range:
        The IP CIDR range of the subnetwork.
    - ipv6_access_type:
        The access type for the IPv6 CIDR range. Possible values are: INTERNAL, EXTERNAL.
    - secondary_ip_ranges:
        A map of objects containing the configuration for the secondary IP ranges of the subnetwork.
        The value is an object with the following attributes:
        - range_name:
            The name of the secondary IP range.
        - ip_cidr_range:
            The IP CIDR range of the secondary IP range.
    EOF
}