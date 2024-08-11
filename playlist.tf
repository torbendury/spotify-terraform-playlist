resource "spotify_playlist" "this" {
  name        = "Terraform"
  description = "The most metal terraform code you'll ever see"
  public      = false

  tracks = [for track in local.track_ids : track["id"]]
}
