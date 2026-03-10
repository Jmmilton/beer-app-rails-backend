require_relative "boot"

require "rails/all"

# Core railties needed for API
require "active_record/railtie"
require "active_model/railtie"
require "active_job/railtie"
require "action_controller/railtie"
require "action_view/railtie"
require "rails/test_unit/railtie"

# Not needed for API-only:
require "action_mailer/railtie"
# require "action_mailbox/engine"
# require "action_text/engine"
# require "action_cable/engine"
require "active_storage/engine"
# require "sprockets/railtie"

Bundler.require(*Rails.groups)

module BeerAppBackend
  class Application < Rails::Application
    # API-only config
    config.load_defaults 6.1
    config.api_only = true
    
    # JSON responses only
    config.generators do |g|
      g.assets false
      g.helper false
      g.test_framework false
      g.jbuilder false
      g.request_specs false
      g.view_specs false
      g.helper_specs false
      g.routing_specs false
    end
    
    # No sessions/cookies
    config.session_store :disabled
    
    # CORS for Vue (localhost:5173)
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins "http://localhost:5173"
        resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options]
      end
    end
  end
end
