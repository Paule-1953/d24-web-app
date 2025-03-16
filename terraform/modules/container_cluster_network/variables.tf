variable "cluster_name" {
  type        = string
  description = <<EOF
  (Required) The name of the cluster, unique within the project and location.
  EOF
}

variable "location" {
  type        = string
  description = <<EOF
  (Optional) The location (region or zone) in which the cluster master will be created, 
  as well as the default node location. If you specify a zone (such as us-central1-a), 
  the cluster will be a zonal cluster with a single cluster master. 
  If you specify a region (such as us-west1),
  the cluster will be a regional cluster with multiple masters spread across zones in the region, 
  and with default node locations in those zones as well
  EOF
}

variable "enable_autopilot" {
  type        = bool
  description = <<EOF
  (Optional) Enable Autopilot for this cluster. Defaults to false. 
  Note that when this option is enabled, certain features of Standard GKE are not available. 
  See the official documentation for available features.
  EOF
}

variable "enable_l4_ilb_subsetting" {
  type        = bool
  description = <<EOF
   (Optional) Whether L4ILB Subsetting is enabled for this cluster.
  EOF
}

variable "stack_type" {
  type        = string
  description = <<EOF
  (Optional) The IP Stack Type of the cluster. 
  Default value is IPV4. Possible values are IPV4 and IPV4_IPV6.
  EOF
}

variable "services_secondary_range_name" {
  type        = string
  description = <<EOF
  (Optional) The name of the existing secondary range in the cluster's subnetwork to use for service ClusterIPs.
  Alternatively, services_ipv4_cidr_block can be used to automatically create a GKE-managed one.
  EOF
}

variable "cluster_secondary_range_name" {
  type        = string
  description = <<EOF
  (Optional) The name of the existing secondary range in the cluster's subnetwork to use for pod IP addresses. 
  Alternatively, cluster_ipv4_cidr_block can be used to automatically create a GKE-managed one.
  EOF
}

variable "deletion_protection" {
  type        = bool
  description = <<EOF
  (Optional) Whether Terraform will be prevented from destroying the cluster. 
  Deleting this cluster via terraform destroy or terraform apply will only succeed if this field is false in the Terraform state.
  EOF
}

variable "auto_create_subnetworks" {
  type        = bool
  description = <<EOF
  (Optional) When set to true, the VPC network is created in auto mode. 
  When set to false, the VPC network is created in custom mode. 
  Defaults to true.
  EOF
}

variable "enable_ula_internal_ipv6" {
  type        = bool
  description = <<EOF
  (Optional) Enable IPv6 for this network. 
  If this field is set to true, the network is created with an IPv6 CIDR range. 
  This field can only be set for custom subnets.
  EOF
}

variable "ip_cidr_range" {
  type        = string
  description = <<EOF
  The IP address range that machines in this network are assigned to, represented as a CIDR block.
  EOF
}

variable "ipv6_access_type" {
  type        = string
  description = <<EOF
  (Optional) The IPv6 access type of the subnetwork. 
  Default value is NONE. Possible values are NONE and EXTERNAL.
  EOF
}

variable "secondary_ip_ranges" {
  type = map(object({
    range_name    = string
    ip_cidr_range = string
  }))
  description = <<EOF
  (Optional) The secondary IP ranges for the subnetwork.
  EOF
}