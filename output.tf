output "ip" {
    value = "${element(concat(google_compute_instance.gpu-vm.*.network_interface.0.access_config.0.nat_ip, list("")), 0)}"
}
