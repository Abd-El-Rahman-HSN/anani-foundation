require_relative 'boot'

require 'rails/all'
require 'dotenv' ; Dotenv.load ".env.local", ".env.#{Rails.env}"
require 'devise'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ananni
  class Application < Rails::Application
    Rails.application.config.assets.precompile += %w( theme.css theme.js theme/*)

    config.serve_static_assets = true
    config.i18n.default_locale = :ar
    I18n.config.available_locales = :ar
    I18n.locale = :ar


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
