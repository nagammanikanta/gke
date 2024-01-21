terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.12.0"
    }
  }
}




provider "google" {
  project     = "coral-current-408814"
  region      = "us-central1"
  credentials = file("tfkey.json")
}