terraform {
  required_version = ">= 0.12"

  required_providers  {
    google-beta = ">= 3.8"
    google = ">= 3.1, < 4.0"
  }
}

provider "google" {
  access_token =  var.access_token
  project = var.project
}

provider "google-beta" {
  access_token = var.access_token
  project = var.project
}

variable "access_token" {}

variable "project" {}
