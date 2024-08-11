# Terraform Spotify Playlist Creator

Provisioning the cleanest Spotify playlists using Terraform. Finally get hassle-free playlists containing your favorite artist. In-order, all album/EP/single releases in order. Sounds like a wet dream? Not anymore.

## How does it work?

This works by utilizing the Spotify Developer Web API. When you have a Spotify account, you can activate developer access for it. Originally, HashiCorp released a [short tutorial](https://developer.hashicorp.com/terraform/tutorials/community-providers/spotify-playlist) for creating a Spotify playlist. 

This inspired me to squeeze out what the `conradludgate/spotify` Terraform Provider has to offer - not that much, unfortunately. I'm not able to search artists, albums, tracks, ... by name, I rather must already know the esoteric ID of all those to create playlists. However, the Spotify Web API goes a step further and offers all that through APIs with searching capabilities: And here we are, creating artist playlists in perfect listening order to listen to the stories artists are trying to tell.

### tl;dr

- `conradludgate/spotify` provider with its own auth-proxy for creating playlists
- `hashicorp/http` for everything else (searching artist, their albums, the containing tracks with their IDs, ...)
- ???
- Profit

## Usage

### Prerequisites

- Docker
- Terraform
- git

### HowTo

1. Create your Spotify Web Developer API access: [Web API | Spotify for Developers](https://developer.spotify.com/documentation/web-api)
2. Clone this repository: `git clone https://github.com/torbendury/spotify-terraform-playlist.git`
3. Create a `.env` file in the repository directory with the contents
   1. `SPOTIFY_CLIENT_REDIRECT_URI=http://localhost:27228/spotify_callback`
   2. `SPOTIFY_CLIENT_ID` can be retrieved from the Spotify API Dashboard
   3. `SPOTIFY_CLIENT_SECRET` can be retrieved from the Spotify API Dashboard
4. Run the `authproxy.sh` (assuming you're using a Linux distribution or macOS, for Windows you might need to run the command inside the script manually)
   1. Open the Auth URL presented by the script
   2. Copy the APIKey
   3. Important: Keep the auth proxy running in a background terminal during your Terraform runs!
5. Create a `terraform.tfvars` file with the following contents
   1. `spotify_api_key` the APIKey from the authproxy script
   2. `artist` the artist you'd like to create a playlist from
      1. Warning: The Terraform config is going to retrieve all tracks by that artist in the end. Retrieving all songs by Opeth seems to be quite a loadtest and the Web API enforces some rate-limiting.
   3. `spotify_client_id` can be retrieved from the Spotify API Dashboard
   4. `spotify_client_secret` can be retrieved from the Spotify API Dashboard
6. Run `terraform apply -var-file=terraform.tfvars` and create your playlist!

## Example

I love myself some new music and listening through all and everything released by an artist, so I maintain [my own playlist](https://open.spotify.com/playlist/1tkcmDSoQTxlvXFCeKvwKC?si=2659168bd0cf484e).

## License

See [LICENSE](LICENSE).
