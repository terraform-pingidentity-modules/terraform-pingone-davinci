terraform {
  required_providers {
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
