resource "google_cloudbuild_trigger" "filename-trigger" {
  location = "us-central1"

  trigger_template {
    branch_name = "main"
    repo_name   = "gke"
  }

  substitutions = {
    _FOO = "bar"
    _BAZ = "qux"
  }

  filename = "test-cloudbuild.yaml"
}