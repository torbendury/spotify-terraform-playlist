# Get all artists albums
data "http" "albums" {
  method = "GET"
  request_headers = {
    "Authorization" = "Bearer ${local.auth_token}"
  }
  url = "https://api.spotify.com/v1/artists/${local.artist_id}/albums?limit=50"
}

locals {
  album_ids = [for a in jsondecode(data.http.albums.response_body)["items"] : a["id"]]
}

data "spotify_album" "albums" {
  for_each   = toset(local.album_ids)
  spotify_id = each.key
}
