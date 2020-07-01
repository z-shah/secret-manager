resource "google_service_account" "svcaccount" {
  account_id   = "tf-svc-account"
  display_name = "Terraform managed service account"
}

resource "google_service_account_key" "sakey" {
  service_account_id = google_service_account.svcaccount.name
}