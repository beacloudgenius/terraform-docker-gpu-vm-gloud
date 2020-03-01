resource "google_compute_firewall" "allow-http-ssh" {
    name = "allow-http-ssh"
    network = "deeplearning"

    allow {
        protocol = "tcp"
        ports = ["22", "80"]
    }

    source_ranges = ["0.0.0.0/0"]
    target_tags = ["deeplearning"]

    depends_on = [
        google_compute_network.deeplearning,
        google_compute_subnetwork.subnetwork,
    ]
}
