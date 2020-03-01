provider "google" {
  credentials = file("credentials.json")
  version = "~> 2.5"
  project = var.project_id
  region  = var.region
}
