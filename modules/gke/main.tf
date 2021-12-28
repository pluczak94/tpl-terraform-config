module "gke" {
  source                 = "terraform-google-modules/kubernetes-engine/google"
  project_id             = var.project
  name                   = "${var.name}-${var.env}"
  regional               = true
  region                 = var.region
  network                = var.network
  subnetwork             = var.subnetwork
  ip_range_services      = var.ip_range_services_name
  ip_range_pods              = var.ip_range_pods_name
  node_pools = [
    {
      name                      = "node-pool"
      machine_type              = "e2-medium"
      node_locations            = "europe-central2-a,europe-central2-b,europe-central2-c"
      min_count                 = 1
      max_count                 = 2
      disk_size_gb              = 30
    },
  ]
}
