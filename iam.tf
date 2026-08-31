resource "google_service_account" "vm" {
  account_id   = "secure-vm-sa"
  display_name = "Secure VM Service Account"
  description  = "Least-privilege service account used by the private workload VM."

  depends_on = [google_project_service.required]
}

resource "google_project_iam_member" "vm_logging" {
  project = var.project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.vm.email}"
}

resource "google_project_iam_member" "vm_monitoring" {
  project = var.project_id
  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${google_service_account.vm.email}"
}
