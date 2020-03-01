resource "google_compute_network" "deeplearning" {
  name = "deeplearning"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnetwork" {
  name   = "subnetwork"
  region = var.region
  ip_cidr_range = "10.2.0.0/16"
  network       = google_compute_network.deeplearning.self_link
  secondary_ip_range {
    range_name    = "tpu-secondary-range"
    ip_cidr_range = "192.168.10.0/24"
  }
}
