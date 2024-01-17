terraform {
  required_providers {
    pingone = {
      source  = "pingidentity/pingone"
      version = "~> 0.25"
    }
    davinci = {
      source  = "pingidentity/davinci"
      version = "~> 0.2"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.4.0"
    }
  }
}
