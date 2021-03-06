require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Asr
  class Application < Rails::Application
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.log_tags  = [:subdomain, :uuid]
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins "mapa.autostoprace.pl"

        resource "*", headers: :any, methods: [:get], max_age: 0
      end
    end
  end
end
