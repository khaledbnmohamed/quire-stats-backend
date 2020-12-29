source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2', '>= 6.0.2.2'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Simple, Fast, and Declarative Serialization Library for Ruby
gem 'blueprinter', '~> 0.23.4'
# Rails PostgreSQL database performance insights. Locks, index usage, buffer cache hit ratios, vacuum stats and more.
gem "rails-pg-extras", '~> 1.1.0'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'

# Use wisper to broadcast events
gem 'wisper', '2.0.0'
# Use wisper-activejob for async broadcasting
gem 'wisper-activejob', '~> 1.0.0'
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Localization Helpers
gem 'devise-i18n', '=1.9.1'
gem 'rails-i18n', '=6.0.0'

# Authentication
gem 'devise', '4.7.1'
gem 'jwt', '2.2.1'
gem 'active_model_otp', '~> 2.0.1'

# Authorization
gem 'pundit', '=2.1.0'

# Search and filtering for AR
gem 'ransack', '=2.3.2'

# ActiveAdmin
gem 'active_admin_theme', '=1.1.1'
gem 'activeadmin', '=2.8.1'

gem "resque", "=2.0.0"
gem 'rswag', '~> 2.3.1'

gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '5.0.0'
gem 'jquery-rails', "4.3.5"
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'httparty', '~> 0.18.0'
gem 'rack-cors', '~> 1.1.0'

gem 'select2-rails', '=4.0.13'

gem 'kaminari', "=1.2.1"

gem "factory_bot_rails", '=5.2.0'
gem 'ffaker', '=2.14.0'
# User carrierwave for file uploads
gem 'carrierwave', '2.1.0'
gem 'fog-aws', '3.7.0'
# Ruby bindings for ImageMagick
gem 'rmagick'

gem 'savon', '~> 2.12.0'

gem 'timecop', '~> 0.9.1'

gem 'rspec-rails', '=4.0.0'
gem 'rspec-collection_matchers', '=1.2.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails', '=2.7.5'

  gem 'pry', '=0.13.1'
  gem 'pry-doc', '=1.1.0'
  gem 'pry-rails', '=0.3.9'
  gem 'webmock', '=3.8.3'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop', '=0.82.0', require: false
  gem 'rubocop-rails', '=2.5.2', require: false
  gem 'rubocop-performance', '=1.5.2', require: false
  gem 'rubocop-rspec', '=1.38.1', require: false
  gem 'overcommit', '~> 0.49.0'

  gem "annotate", "=3.1.1"
  gem "brakeman", '=4.8.1', require: false
  gem 'bullet', '=6.1.0'
end

group :test do
  gem "simplecov", '=0.18.5', require: false
  gem 'shoulda-matchers', "~> 4.3.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
