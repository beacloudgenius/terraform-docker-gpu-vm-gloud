resource "google_compute_instance" "gpu-vm" {

  depends_on = [
    null_resource.delay,
    google_compute_firewall.allow-http-ssh,
  ]

  count        = 1
  name         = "gpu-vm"
  machine_type = "n1-standard-4"
  zone         = var.zone

  tags = ["deeplearning"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
      size = 50
    }
  }

  network_interface {
    network = "deeplearning"
    subnetwork = "subnetwork"
    access_config {
      // Ephemeral IP - leaving this block empty will generate a new external IP and assign it to the machine
    }
  }

  guest_accelerator{
    type = "nvidia-tesla-t4" // Type of GPU attahced
    count = 1 // Num of GPU attached
  }

  scheduling{
    on_host_maintenance = "TERMINATE" // Need to terminate GPU on maintenance
  }

  metadata_startup_script = file("start-up-script")

}
