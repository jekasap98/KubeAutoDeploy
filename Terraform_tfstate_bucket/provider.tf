provider "google" {
  project = "project_name"
  
  credentials = file("path")
  
  region = "europe-north1"
  
  zone = "europe-north1-a"  
}