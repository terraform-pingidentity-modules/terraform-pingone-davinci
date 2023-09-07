terraform {
  required_providers {
    pingone = {
      source  = "pingidentity/pingone"
      version = "~> 0.18"
    }
    davinci = {
      source  = "pingidentity/davinci"
      version = "~> 0.1"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.4.0"
    }
  }
}
