resource "google_kms_key_ring" "key-ring-tf" {
  name     = "key-ring-tf"
  location = "global"
}
resource "google_kms_crypto_key" "key" {
  name            = "crypto-key-example"
  key_ring        = google_kms_key_ring.keyring.id
  
  lifecycle {
    prevent_destroy = false
  }
}

data "google_iam_policy" "admin" {
  binding {
    role = "roles/cloudkms.cryptoKeyEncrypter"

    members = [
      "user:terraform@data-rainfall-396303.iam.gserviceaccount.com",
    ]
  }
}
