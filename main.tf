data "google_project" "project" {}



resource "google_kms_crypto_key_iam_member" "kms-secret-binding" {
  kms_key_name= "kms-key"
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = "serviceAccount:terraform-${data.google_project.project.number}@data-rainfall-396303.iam.gserviceaccount.com"
}

resource "google_secret_manager_secret" "secret-with-automatic-cmek" {
  secret_id = "secret"

  replication {
    auto {
      customer_managed_encryption {
        kms_key_name = "kms-key"
      }
    }
  }

  depends_on = [ google_kms_crypto_key_iam_member.kms-secret-binding ]
}