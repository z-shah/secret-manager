locals {
  prefix = var.prefix != "" ? "${var.prefix}-" : ""
  names  = toset(var.names)
}

resource "google_service_account" "svcaccount" {
  for_each     = local.names
  account_id   = "${local.prefix}${lower(each.value)}"
  display_name = "Terraform Managed Service Account-${lower(each.value)}"
}

resource "google_service_account_key" "sakey" {
  for_each           = local.names
  service_account_id = google_service_account.svcaccount[each.value].email
}

