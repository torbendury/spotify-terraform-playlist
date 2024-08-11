terraform {
  required_providers {
    spotify = {
      source  = "conradludgate/spotify"
      version = "0.2.7"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.4.4"
    }
  }
}

provider "spotify" {
  api_key = var.spotify_api_key
}
