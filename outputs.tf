output "instance" {
  description = "The GCP instance resource."
  value       = google_compute_instance.this
}

output "name_ip" {
  description = "Hash of name/IP"
  value = {
    (google_compute_instance.this.name) = {
      public_ip  = try(google_compute_instance.this.network_interface.0.access_config.0.nat_ip, null),
      private_ip = google_compute_instance.this.network_interface.0.network_ip
    }
  }
}