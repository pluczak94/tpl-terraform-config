module "redis" {
  source = "terraform-google-modules/memorystore/google"
  version = "4.0.0"

  name = "tcl-redis"
  redis_version = "REDIS_5_0"
  project = var.project
  authorized_network = var.network
  region = var.region
}