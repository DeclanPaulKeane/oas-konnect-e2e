# OAS to Kong Konnect Terraform

Convert OpenAPI Specifications to Kong Konnect resources using Terraform.

## Prerequisites

### Tools
- [Deck CLI](https://github.com/kong/deck)
- [Terraform](https://www.terraform.io/)

### Environment Variables
Set these before running Terraform:

```bash
export TF_VAR_control_plane_id="52ea7xxxxxx"
export TF_VAR_konnect_pat="kpat_xxxxxx"
export TF_VAR_konnect_server_url="https://us.api.konghq.com"
export TF_VAR_portal_id="1edcxxxxxxx"
```

## Quick Start

### 1. Generate Kong Configuration
```bash
deck file openapi2kong --spec ./openapi.yaml --output-file kong.yaml
deck file add-plugins -s kong.yaml -o kong.yaml ./plugins/*
deck file patch -s kong.yaml -o kong.yaml ./patches/*
deck file kong2tf -s kong.yaml -o ./service.tf
```

### 2. Initialize Terraform
```bash
terraform init
```

### 3. Plan Deployment
```bash
# Make sure environment variables are set first
terraform plan
```

### 4. Apply Configuration
```bash
# Make sure environment variables are set first
terraform apply
```

### 5. Clean Up (Optional)
```bash
# Make sure environment variables are set first
terraform destroy
```

## What This Does

- Converts `openapi.yaml` to Kong configuration
- Adds plugins from `plugins/` directory
- Applies patches from `patches/` directory
- Generates Terraform configuration
- Deploys to Kong Konnect with portal integration

## Files

- `openapi.yaml` - Your API specification
- `install.sh` - Generation script from OpenAPI to Kong
- `portal-api.tf` - Portal resources
- `main.tf` - Provider configuration
- `variables.tf` - Variable definitions

## Configuration Files

### main.tf
- Sets up Kong Konnect providers (both regular and beta)
- Configures provider authentication

### variables.tf
- Defines required variables for Kong Konnect connection
- Includes control plane ID, PAT, server URL, and portal ID


### portal-api.tf
- Defines API resources for Kong Konnect portal
- Links APIs to services and publishes them to the portal
- Includes API specifications