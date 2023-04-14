variable "region" {
  description = "GCP Region for this VM."
  type        = string
}

variable "ssh_public_key" {
  description = "The ssh public key."
  type        = string
}

variable "instance_name" {
  description = "Name of the instance."
  type        = string
}

variable "machine_type" {
  description = "Size of instance."
  type        = string
  default     = "e2-small"
}

variable "security_group_id" {
  description = "Security Group ID"
  type        = string
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

variable "zone_number" {
  description = "Zone number index as provided by the google_compute_zones data resource."
  type        = number
  default     = 0
}