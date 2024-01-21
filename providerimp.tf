terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.12.0"
    }
  }
}

provider "google" {
  project     = "leafy-summer-405104"
  region      = "us-central1"
  credentials = file("manikey.json")
}
