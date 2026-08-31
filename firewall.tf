resource "google_compute_firewall" "allow_internal" {
  name      = "allow-internal-vpc"
  network   = google_compute_network.main.name
  direction = "INGRESS"
  priority  = 1000

  source_ranges = [
    var.management_subnet_cidr,
    var.workload_subnet_cidr
  ]

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["1-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["1-65535"]
  }
}

resource "google_compute_firewall" "allow_iap_ssh" {
  name      = "allow-iap-ssh"
  network   = google_compute_network.main.name
  direction = "INGRESS"
  priority  = 900

  source_ranges = ["35.235.240.0/20"]
  target_tags   = ["iap-ssh"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}
