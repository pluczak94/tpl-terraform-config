provider "google" {
  project = var.project
}


module "vpc" {
  source     = "./modules/vpc"
  project    = var.project
  region     = var.region
  network    = var.network
  subnetwork = var.subnetwork
}

module "gke" {
  source     = "./modules/gke"
  project    = var.project
  region     = var.region
  network    = var.network
  subnetwork = var.subnetwork
  depends_on = ["module.vpc"]

}