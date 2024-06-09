variable "node_count" {
  type = number
  default = 2
}

variable "gke_location" {
  type = string
  default = "asia-east1-a"
}

variable "google_project" {
  type = string
  default = "Yours google proj"
}

variable "google_region" {
  type = string
  default = "asia-east1-a"
}

variable "google_zone" {
  type = string
  default = "asia-east1-a"
}

variable "google_credentials_path" {
  type = string
  default = "credentials_path"
}