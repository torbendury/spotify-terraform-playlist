data "http" "auth_token" {
  method = "POST"
  url    = "https://accounts.spotify.com/api/token"
  request_headers = {
    "Content-Type" = "application/x-www-form-urlencoded"
  }
  request_body = "grant_type=client_credentials&client_id=${var.spotify_client_id}&client_secret=${var.spotify_client_secret}"
}

locals {
  auth_token = jsondecode(data.http.auth_token.response_body)["access_token"]
}
