terraform {
  backend "gcs" {
    bucket = "tcl-exercises-tfstate"
  }
}