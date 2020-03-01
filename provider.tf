provider "google" {
  credentials = file("credentials.json")
  version = "~> 2.20"
  project = var.project_id
  region  = var.region
}

provider "null" {
  version = "~> 2.1"
}
