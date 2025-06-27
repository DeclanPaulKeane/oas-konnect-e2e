variable "konnect_pat" {
  description = "Kong Konnect Personal Access Token"
  type        = string
  sensitive   = true
}

variable "konnect_server_url" {
  description = "Kong Konnect API server URL"
  type        = string
  default     = "https://us.api.konghq.com"
}

# variable "control_plane_id" {
#   description = "ID of the existing control plane"
#   type        = string
# }

variable "portal_id" {
  description = "ID of the portal for API publication"
  type        = string
} 