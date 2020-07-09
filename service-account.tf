locals {
  prefix = var.prefix != "" ? "${var.prefix}" : ""
  names  = toset(var.serviceaccounts)
}

resource "google_service_account" "svcaccount" {
  for_each     = local.names
  account_id   = "${local.prefix}-${lower(each.value)}"
  display_name = "tf-managed-${lower(each.value)}"
}

resource "google_service_account_key" "sakey" {
  for_each           = local.names
  private_key_type   = "TYPE_GOOGLE_CREDENTIALS_FILE"
  service_account_id = google_service_account.svcaccount[each.value].email
}

