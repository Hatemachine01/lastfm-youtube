require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV["SPOTIFY_KEY_1"],  ENV["SPOTIFY_KEY_2"], scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
end