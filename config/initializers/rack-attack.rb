# config/initializers/rack_attack.rb
Rack::Attack.throttle('password resets by ip', limit: 5, period: 60) do |req|
  req.ip if req.path == '/users/password' && req.post?
end

Rack::Attack.throttle('logins by ip', limit: 10, period: 60) do |req|
  req.ip if req.path == '/users/sign_in' && req.post?
end

Rack::Attack.throttle('signups by ip', limit: 5, period: 60) do |req|
  req.ip if req.path == '/users' && req.post?
end

# Return JSON instead of default text response
Rack::Attack.throttled_responder = lambda do |_req|
  [429, { 'Content-Type' => 'application/json' }, [{ error: 'Too many requests. Please try again later.' }.to_json]]
end