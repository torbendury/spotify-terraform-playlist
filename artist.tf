data "http" "artist" {
  method = "GET"
  request_headers = {
    "Authorization" = "Bearer ${local.auth_token}"
  }
  url = "https://api.spotify.com/v1/search?q=artist%3A${local.artist_in}&type=artist&limit=1&offset=0"
}

locals {
  artist_in = replace(var.artist, " ", "+")

  artist_id = jsondecode(data.http.artist.response_body)["artists"]["items"][0]["id"]
}
