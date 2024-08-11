# Get all artists albums
data "http" "track" {
  for_each = toset(local.album_ids)

  method = "GET"
  url    = "https://api.spotify.com/v1/albums/${each.key}/tracks?limit=30"

  request_headers = {
    "Authorization" = "Bearer ${local.auth_token}"
  }
}

locals {
  track_ids = flatten([
    for album in data.http.track : [
      for t in jsondecode(album.response_body)["items"] : {
        id           = t["id"],
        track_number = t["track_number"]
      }
    ]
  ])
}
