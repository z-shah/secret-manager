resource "google_secret_manager_secret" "sa-key" {
  for_each = local.names
  secret_id = "${local.prefix}${lower(each.value)}"

  labels = {
    env  = "dev"
  }

  replication {
    automatic = true
  }
}


resource "google_secret_manager_secret_version" "sa-key-version-basic" {
  for_each = local.names
  secret      = google_secret_manager_secret.sa-key[each.value].id
  secret_data = base64decode(google_service_account_key.sakey[each.value].private_key)
}