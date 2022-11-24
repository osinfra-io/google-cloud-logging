terraform {

  # Requiring Providers
  # https://www.terraform.io/language/providers/requirements#requiring-providers

  required_providers {

    # Google Cloud Platform Provider
    # https://registry.terraform.io/providers/hashicorp/google/latest/docs

    google = {
      source = "hashicorp/google"
    }
  }
}

# Google Project Module (osinfra.io)
# https://github.com/osinfra-io/terraform-google-project

module "projects" {
  source = "github.com/osinfra-io/terraform-google-project"

  # Max of 200 sinks per project, if you need more, create a new project

  for_each = toset(
    [
      "logs01"
    ]
  )

  billing_account = var.billing_account
  cost_center     = "x001"
  env             = var.env
  folder_id       = var.folder_id

  labels = {
    "environment" = var.env,
    "system"      = "logging",
    "team"        = "shared"
  }

  prefix = "shared"
  system = each.key
}