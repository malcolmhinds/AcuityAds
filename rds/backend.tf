terraform {
  backend "s3" {
    key = "terraform/tfstate.tfstate"
    bucket = "mhinds-remmote-backend"
    region = "ca-central-1"
    access_key = "AKIAR4WDINWBLZ5F7NW3"
    secret_key = "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"
  }
}
