provider "google" {
  project     = "data-rainfall-396303"
  region      = "us-central"
  zone = "us-central1-a"
  credentials = file("mykey.json")
}