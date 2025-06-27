# Reference the API created in service.tf
# The actual resource names from service.tf are:
# - konnect_gateway_service.httpbin_api
# - konnect_api.httpbin_api (if it exists)

resource "konnect_api" "httpbin_api" {
  provider    = konnect-beta
  name        = "Httpbin API Terraform"
  version     = "v1"
  description = "This is a description of a httpbin  API"
  labels = {
    key = "value"
  }
}

resource "konnect_api_implementation" "portal_implementation" {
  provider = konnect-beta
  api_id   = konnect_api.httpbin_api.id
  service = {
    control_plane_id = var.control_plane_id
    id               = konnect_gateway_service.httpbin_api.id
  }
}

resource "konnect_api_publication" "portal_publication" {
  provider                   = konnect-beta
  api_id                     = konnect_api.httpbin_api.id
  portal_id                  = var.portal_id
  auto_approve_registrations = true
  visibility                 = "private"
}

resource "konnect_api_specification" "portal_specification" {
  provider = konnect-beta
  api_id   = konnect_api.httpbin_api.id
  content  = file("openapi.yaml")
  type     = "oas3"
}
