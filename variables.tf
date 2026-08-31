variable "project_id" {
  description = "Google Cloud project ID."
  type        = string
}

variable "region" {
  description = "Primary GCP region."
  type        = string
  default     = "me-central2"
}

variable "zone" {
  description = "Primary GCP zone."
  type        = string
  default     = "me-central2-a"
}

variable "vpc_name" {
  description = "Name of the custom VPC."
  type        = string
  default     = "secure-vpc"
}

variable "management_subnet_cidr" {
  description = "CIDR for the management subnet."
  type        = string
  default     = "10.10.10.0/24"
}

variable "workload_subnet_cidr" {
  description = "CIDR for the private workload subnet."
  type        = string
  default     = "10.10.20.0/24"
}

variable "machine_type" {
  description = "Compute Engine machine type."
  type        = string
  default     = "e2-micro"
}
