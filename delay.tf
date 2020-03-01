// resource "null_resource" "before" {
// }

resource "null_resource" "delay" {
  provisioner "local-exec" {
    command = "sleep 30"
  }
  triggers = {
  // "before" = null_resource.before.id
    "before" = google_compute_subnetwork.subnetwork.id
  }
}

// resource "null_resource" "after" {
//   depends_on = [null_resource.delay]
// }
