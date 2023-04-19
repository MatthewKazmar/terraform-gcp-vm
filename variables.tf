variable "avx_gcp_account_name" {
  description = "GCP account as it appears in the controller."
  type        = string
}

variable "region" {
  description = "GCP Region for this VM."
  type        = string
}

variable "ssh_public_key" {
  description = "The ssh public key."
  type        = string
}

variable "name" {
  description = "Name of the instance."
  type        = string
}

variable "machine_type" {
  description = "Size of instance."
  type        = string
  default     = "e2-small"
}

variable "subnetwork_self_link" {
  description = "Subnet Self_link"
  type        = string
}

variable "network_tags" {
  description = "Map of tags to apply to the instance."
  type        = list(string)
  default     = []
}

variable "instance_number" {
  description = "Zone number index as provided by the google_compute_zones data resource."
  type        = number
  default     = 0
}

locals {
  zone_number = var.instance_number % length(data.google_compute_zones.this.names)
}