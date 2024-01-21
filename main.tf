data "google_compute_instance" "nexus" {
  name = "primary-application-server"
  zone = "us-central1-a"
}