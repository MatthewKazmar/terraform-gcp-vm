output "gcp_instance" {
  description = "The GCP instance resource."
  value = google_compute_instance.this
}