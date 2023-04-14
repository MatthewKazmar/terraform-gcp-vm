data "google_compute_default_service_account" "default" {}

data "google_compute_zones" "this" {
  region = var.gcp_east_region
  status = "UP"
}

resource "google_compute_instance" "this" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = data.google_compute_zones.this.names[0]

  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-2204-jammy-v20230302"
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${chomp(var.ssh_public_key)}"
  }

  network_interface {
    subnetwork = var.subnetwork_self_link
    access_config {}
  }

  service_account {
    email  = data.google_compute_default_service_account.default.email
    scopes = ["cloud-platform"]
  }
}