variable "access_token" {}

variable "project" {}

variable "prefix" {
  type    = string
  default = "tf"
}

variable "names" {
  type        = list(string)
  description = "Names of the service accounts to create."
  default     = ["serviceaccount1", "serviceaccount2", "serviceaccount3"]
}