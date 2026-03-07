require 'rack/cors' 
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:5173',
            'https://jmmilton.github.io',
            'https://mybrews.app',
            'http://mybrews.app'
    resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options]
  end
end