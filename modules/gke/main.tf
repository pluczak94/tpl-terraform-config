module "gke" {
  source                 = "terraform-google-modules/kubernetes-engine/google"
  project_id             = var.project
  name                   = "${var.name}-${var.env}"
  regional               = true
  region                 = var.region
  network                = var.network
  create_service_account = false
  subnetwork             = var.subnetwork
  ip_range_services      = var.ip_range_services_name
  ip_range_pods          = var.ip_range_pods_name
  node_pools = [
    {
      name = "tcl-pool"
      machine_type = "e2-medium"
      node_locations = "europe-central2-a,europe-central2-b,europe-central2-c"
      service_account = var.cluster_sa
      min_count = 1
      max_count = 1
      disk_size_gb = 30
    }
  ]

      node_pools_oauth_scopes = {
        node-pool = [
          "https://www.googleapis.com/auth/cloud-platform",
          "https://www.googleapis.com/auth/trace.append",
          "https://www.googleapis.com/auth/monitoring",
          "https://www.googleapis.com/auth/logging.write"

        ]
      }
}
