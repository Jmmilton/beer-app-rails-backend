source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0"

# Rails API-only components (no sprockets, no assets)
gem 'railties', '~> 6.1.7'
gem 'activesupport', '~> 6.1.7'
gem 'activerecord', '~> 6.1.7'
gem 'activemodel', '~> 6.1.7'
gem 'activejob', '~> 6.1.7'
gem 'actionpack', '~> 6.1.7'
gem 'actionview', '~> 6.1.7'

# Required for Ruby 2.6 compatibility
# gem 'logger'

# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.4'
# Use Puma as the app server
gem 'puma', '~> 5.0'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# CORS for Vue frontend
gem 'rack-cors'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '~> 3.3'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'dotenv-rails', groups: [:development, :test]
gem 'activestorage'
gem 'aws-sdk-s3', require: false

gem 'pg'
gem "devise"
gem 'devise-jwt'
gem 'actionmailer'
gem 'responders'