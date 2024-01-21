resource "google_storage_bucket" "my-bucket" {
 name          = "big-gcs"
 project       = "leafy-summer-405104"
 location      = "US"
 force_destroy = true
}

resource "google_compute_instance" "ne-tf" {
    project = "leafy-summer-405104"
    
    name = "nexus"
    machine_type = "e2-medium"
    boot_disk {
        initialize_params {
            image = "debian-11-bullseye-v20220719"
        }
    }
    network_interface {
        network = google_compute_network.vpc-terra.id
        subnetwork = google_compute_subnetwork.subnet-terra.id
        access_config {
        }
    }
    
  
}

resource "google_compute_network" "vpc-terra" {
    project = "leafy-summer-405104"
    name = "vpc-demo"
    auto_create_subnetworks = false
  
}

resource "google_compute_subnetwork" "subnet-terra" {
    project = "leafy-summer-405104"
    name = "subnet-demo"
    ip_cidr_range = "10.0.2.0/24"
    region = "us-central1"
    
    network = google_compute_network.vpc-terra.id  
}