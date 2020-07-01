resource "google_secret_manager_secret" "sa-key" {
  secret_id = "sa-key"

  labels = {
    type = "sa-key"
    env  = "dev"
  }

  replication {
    automatic = true
  }
}


resource "google_secret_manager_secret_version" "sa-key-version-basic" {
  secret = google_secret_manager_secret.sa-key.id
  secret_data = base64decode(google_service_account_key.sakey.private_key)
}