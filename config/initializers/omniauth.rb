require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV["spotify_key_1"],  ENV["spotify_key_2"], scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
end