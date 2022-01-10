provider "google" {
  project = var.project_id
}


module "service_accounts" {
  source = "./modules/service_account"
  project_id = var.project_id

}

module "vpc" {
  source = "./modules/vpc"
  project = var.project_id
  region = var.region
  network = var.network
  subnetwork = var.subnetwork
}

module "redis" {
  source = "./modules/redis"
  project = var.project_id
  network = var.network
  region = var.region
}

module "gke" {
  source = "./modules/gke"
  project = var.project_id
  region = var.region
  network = module.vpc.network_name
  subnetwork = module.vpc.subnetwork
  cluster_sa = module.service_accounts.cluster_sa

}


output "network" {
  value = module.vpc.network_name
}
output "subnetwork" {
  value = module.vpc.subnetwork
}
output "redis_host" {
  value = module.redis.redis_host
}
output "redis_port" {
  value = module.redis.redis_port
}
output "cluster_sa" {
  value = module.service_accounts.cluster_sa
}
