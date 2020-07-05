require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CashbackApp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.time_zone = 'America/Fortaleza'

    # loading parsers
    config.autoload_paths << Rails.root.join('lib', 'operation')
    config.autoload_paths << Rails.root.join('app', 'operations', '**', '*.rb')

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.enforce_available_locales = true
    config.i18n.default_locale = :'pt-BR'
    config.i18n.available_locales = [:'pt-BR', :en]

    # Use SQL instead of AR schema dumper when creating the database
    config.active_record.schema_format = :sql

    # Change assets generator
    config.generators.assets :my_assets
  end
end
