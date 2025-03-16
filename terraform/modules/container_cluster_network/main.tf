# Ref: https://github.com/terraform-google-modules/terraform-docs-samples/blob/main/gke/quickstart/autopilot/cluster.tf
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_network
resource "google_compute_network" "this" {
  name = "${var.cluster_name}-network"

  auto_create_subnetworks  = var.auto_create_subnetworks
  enable_ula_internal_ipv6 = var.enable_ula_internal_ipv6
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_subnetwork
resource "google_compute_subnetwork" "this" {
  name = "${var.cluster_name}-subnetwork"

  ip_cidr_range = var.ip_cidr_range
  region        = var.location

  stack_type       = var.stack_type
  ipv6_access_type = var.ipv6_access_type # Change to "EXTERNAL" if creating an external loadbalancer

  network = google_compute_network.this.id
  dynamic "secondary_ip_range" {
    for_each = var.secondary_ip_ranges
    content {
      range_name    = secondary_ip_range.value.range_name
      ip_cidr_range = secondary_ip_range.value.ip_cidr_range
    }
  }
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster
resource "google_container_cluster" "this" {
  name = var.cluster_name

  location                 = var.location
  enable_autopilot         = var.enable_autopilot
  enable_l4_ilb_subsetting = var.enable_l4_ilb_subsetting

  network    = google_compute_network.this.id
  subnetwork = google_compute_subnetwork.this.id

  ip_allocation_policy {
    stack_type                    = var.stack_type
    services_secondary_range_name = var.services_secondary_range_name #google_compute_subnetwork.this.secondary_ip_range[0].range_name
    cluster_secondary_range_name  = var.cluster_secondary_range_name  #google_compute_subnetwork.this.secondary_ip_range[1].range_name
  }

  # Set `deletion_protection` to `true` will ensure that one cannot
  # accidentally delete this instance by use of Terraform.
  deletion_protection = var.deletion_protection
}