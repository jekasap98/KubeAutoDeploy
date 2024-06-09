provider "google" {
  project = "project" #Put your project name
  
  credentials = file("/path")
  
  region = "europe-north1" 
  
  zone = "europe-north1-a"   
}