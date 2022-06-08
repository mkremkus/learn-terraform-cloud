terraform {
/*
  cloud {
    organization = "Kremkus-Terraform-Test"

    workspaces {
      name = "learn-terraform-cloud"
    }
  }
*/
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.23.0"
    }
  }

  required_version = ">= 0.14.0"
}
