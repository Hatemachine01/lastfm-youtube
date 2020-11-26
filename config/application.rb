require_relative 'boot'


require 'rails/all'

Bundler.require(*Rails.groups)

module LastfmYoutube
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.autoload_paths << Rails.root.join('lib')
    RSpotify::authenticate("39df322a7d474ea99182fb69e4d1c524", "a37ec65daf3647168470d20cc28a5449")

  end
end
