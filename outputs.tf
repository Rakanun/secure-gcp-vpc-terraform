output "vpc_name" {
  description = "Created VPC name."
  value       = google_compute_network.main.name
}

output "management_subnet" {
  description = "Management subnet name and CIDR."
  value = {
    name = google_compute_subnetwork.management.name
    cidr = google_compute_subnetwork.management.ip_cidr_range
  }
}

output "workload_subnet" {
  description = "Private workload subnet name and CIDR."
  value = {
    name = google_compute_subnetwork.workload.name
    cidr = google_compute_subnetwork.workload.ip_cidr_range
  }
}

output "private_vm_internal_ip" {
  description = "Internal IPv4 address of the private workload VM."
  value       = google_compute_instance.private_vm.network_interface[0].network_ip
}

output "vm_service_account" {
  description = "Service account attached to the VM."
  value       = google_service_account.vm.email
}

output "iap_ssh_command" {
  description = "Example command to connect to the private VM through IAP."
  value       = "gcloud compute ssh ${google_compute_instance.private_vm.name} --zone=${var.zone} --tunnel-through-iap --project=${var.project_id}"
}
