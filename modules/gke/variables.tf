variable "project" {}
variable "name" {
  default = "tcp-cluster"
}
variable "env" {
  default = "dev"
}
variable "region" {}
variable "network" {}
variable "cluster_sa" {}
variable "subnetwork" {}
variable "ip_range_pods_name" {
  description = "The secondary ip range to use for pods"
  default     = "ip-range-pods"
}
variable "ip_range_services_name" {
  description = "The secondary ip range to use for services"
  default     = "ip-range-services"
}
