data "google_compute_instance" "existing_instance" {
  name = "nexus"
  
  zone = "us-central1-a"
}