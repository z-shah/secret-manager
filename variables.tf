variable "access_token" {}

variable "project" {}

variable "prefix" {
  type    = string
  default = "tf"
}

variable "serviceaccounts" {
  type = list(string)
  default = ["sa-1", "sa-2", "sa-3"]
}