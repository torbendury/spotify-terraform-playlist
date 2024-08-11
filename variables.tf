
# See https://github.com/conradludgate/terraform-provider-spotify#how-to-use
# for how to get an api key
variable "spotify_api_key" {
  type = string
}

variable "artist" {
  type = string
}

variable "spotify_client_id" {
  type = string
}

variable "spotify_client_secret" {
  type = string
}
