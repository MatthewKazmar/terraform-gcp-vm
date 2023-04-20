data "aviatrix_account" "this" {
  account_name = var.avx_gcp_account_name
}


data "google_compute_default_service_account" "default" {
  project = data.aviatrix_account.this.gcloud_project_id
}

data "google_compute_zones" "this" {
  region = var.region
  status = "UP"
}


data "google_compute_image" "this" {
  project = "ubuntu-os-cloud"
  family  = "ubuntu-2204-lts"
}

resource "google_compute_instance" "this" {
  project = data.aviatrix_account.this.gcloud_project_id

  name         = var.name
  machine_type = var.machine_type
  zone         = data.google_compute_zones.this.names[local.zone_number]

  boot_disk {
    initialize_params {
      image = data.google_compute_image.this.self_link
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