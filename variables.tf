variable "project_id" {
  description = "Project ID in GCP"
}

variable "region" {
  description = "Region in which to manage GCP resources"
}

variable "zone" {
  default = "us-west1-a"
  description = "Zone in which to manage GCP resources"
}
