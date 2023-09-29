data "google_project" "project" {}



resource "google_kms_crypto_key_iam_member" "kms-secret-binding" {
crypto_key_id = "kms-secret-binding"
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = "serviceAccount:terraform-${data.google_project.project.number}@data-rainfall-396303.iam.gserviceaccount.com"
}

resource "google_secret_manager_secret" "secret-with-automatic-cmek" {
  secret_id = "secret"

  replication {
    auto {
      customer_managed_encryption {
        kms_key_name = "kms-secret-binding"
      }
    }
  }

  depends_on = [ google_kms_crypto_key_iam_member.kms-secret-binding ]
}
resource "google_kms_key_ring" "my-key-ring" {
 
  name     = "my-key-ring"
  location = "us-central1"
}

resource "google_kms_crypto_key" "my-crypto-key" {
  name     = "my-crypto-key"
  key_ring = google_kms_key_ring.my-key-ring.name
}