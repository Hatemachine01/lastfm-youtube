require_relative 'boot'


require 'rails/all'


Bundler.require(*Rails.groups)

Dotenv::Railtie.load

HOSTNAME = ENV['HOSTNAME']

module LastfmYoutube
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.autoload_paths << Rails.root.join('lib')
    RSpotify::authenticate(
     ENV["SPOTIFY_KEY_1"], ENV["SPOTIFY_KEY_2"])

  end
end
