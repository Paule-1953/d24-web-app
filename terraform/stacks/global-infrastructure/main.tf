# Ref: https://github.com/terraform-google-modules/terraform-docs-samples/blob/main/gke/quickstart/autopilot/cluster.tf
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_network
resource "google_compute_network" "this" {
  name = "web-app-network"

  auto_create_subnetworks  = false
  enable_ula_internal_ipv6 = true
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_subnetwork
resource "google_compute_subnetwork" "this" {
  name = "web-app-subnetwork"

  ip_cidr_range = "10.0.0.0/16"
  region        = "europe-west3"

  stack_type       = "IPV4_IPV6"
  ipv6_access_type = "EXTERNAL" # Change to "EXTERNAL" if creating an external loadbalancer

  network = google_compute_network.this.id
  secondary_ip_range {
    range_name    = "services-range"
    ip_cidr_range = "192.168.0.0/24"
  }

  secondary_ip_range {
    range_name    = "pod-ranges"
    ip_cidr_range = "192.168.1.0/24"
  }

  # Add new secondary IP ranges
  secondary_ip_range {
    range_name    = "new-services-range"
    ip_cidr_range = "192.168.16.0/20"
  }

  secondary_ip_range {
    range_name    = "new-pod-ranges"
    ip_cidr_range = "192.168.32.0/20"
  }
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster
resource "google_container_cluster" "this" {
  name = "web-app-autopilot-cluster"

  location                 = "europe-west3"
  enable_autopilot         = true
  enable_l4_ilb_subsetting = true

  network    = google_compute_network.this.id
  subnetwork = google_compute_subnetwork.this.id

  ip_allocation_policy {
    stack_type = "IPV4_IPV6"
    services_secondary_range_name = google_compute_subnetwork.this.secondary_ip_range[0].range_name
    cluster_secondary_range_name  = google_compute_subnetwork.this.secondary_ip_range[1].range_name
    #services_secondary_range_name = "new-services-range"
    #cluster_secondary_range_name  = "new-pod-ranges"
  }

  # Set `deletion_protection` to `true` will ensure that one cannot
  # accidentally delete this instance by use of Terraform.
  deletion_protection = false
}