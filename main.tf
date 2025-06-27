terraform {
  required_providers {
    konnect = {
      source = "kong/konnect"
      version = "~> 2.8.1"
    }
    konnect-beta = {
      source = "kong/konnect-beta"
    }
  }
}

provider "konnect" {
  personal_access_token = var.konnect_pat
  server_url           = var.konnect_server_url
}

provider "konnect-beta" {
  personal_access_token = var.konnect_pat
  server_url            = var.konnect_server_url
}