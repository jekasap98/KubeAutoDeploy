resource "google_service_account" "default" {
  account_id   = "service-account-id-gejks"
  display_name = "Service Account GKE"
}

resource "google_container_cluster" "primary" {
  name     = "dos18-test-cluster"
  location = var.gke_location

  remove_default_node_pool = true
  initial_node_count = 1

  deletion_protection = false

}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "main-pool"
  location   = var.gke_location
  cluster    = google_container_cluster.primary.name
  node_count = var.node_count

  node_config {
    preemptible  = true
    machine_type = "e2-medium" #data.google_compute_machine_types.e2-medium.id
    disk_type = "pd-standard"
    disk_size_gb = "30"
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.default.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
  
}
