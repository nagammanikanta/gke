data "google_compute_instance" "existing_instance" {
  name = "nexus-instance"
  
  zone = "us-central1-a"
}