data "google_compute_instance" "existing_instance" {
  name = "nexus"
  project ="leafy-summer-405104"
  zone = "us-central1-a"
  depends_on = [google_compute_instance.nexus]
  
}