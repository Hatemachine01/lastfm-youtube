require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "39df322a7d474ea99182fb69e4d1c524", "a37ec65daf3647168470d20cc28a5449", scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
end