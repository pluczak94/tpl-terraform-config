module "gcloud" {
  source  = "terraform-google-modules/gcloud/google"
  version = "~> 2.0"

  platform = "linux"
  additional_components = ["beta"]

  create_cmd_entrypoint  = "gcloud"
  create_cmd_body        = "version"
  destroy_cmd_entrypoint = "gcloud"
  destroy_cmd_body       = "version"
}