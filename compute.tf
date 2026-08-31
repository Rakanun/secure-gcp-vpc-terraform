resource "google_compute_instance" "private_vm" {
  name         = "private-workload-vm"
  machine_type = var.machine_type
  zone         = var.zone
  tags         = ["iap-ssh", "private-workload"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = 10
      type  = "pd-balanced"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.workload.id
    # Intentionally no access_config block: the VM gets no external IPv4 address.
  }

  service_account {
    email  = google_service_account.vm.email
    scopes = ["cloud-platform"]
  }

  metadata = {
    enable-oslogin = "TRUE"
  }

  shielded_instance_config {
    enable_secure_boot          = true
    enable_vtpm                 = true
    enable_integrity_monitoring = true
  }

  labels = {
    environment = "portfolio"
    managed_by  = "terraform"
  }

  depends_on = [
    google_project_service.required,
    google_project_iam_member.vm_logging,
    google_project_iam_member.vm_monitoring,
    google_compute_router_nat.nat
  ]
}
