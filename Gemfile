source 'https://rubygems.org'
source 'https://gem.fury.io/engineerai'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.6'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
gem 'factory_bot_rails'
gem 'faker'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'simplecov', '<= 0.17'
  gem 'rspec-sonarqube-formatter', '~> 1.5', require: false
  gem 'faker'
  gem "capybara"
  gem 'shoulda-matchers'
  gem 'shoulda-callback-matchers'
  gem 'rubocop-rspec', require: false
  gem 'database_cleaner'
  gem 'dotenv-rails'
  gem 'rails-controller-testing'
end

group :development do
  gem 'dotenv-rails'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'bx_block_photo_library-6419d914', '0.0.2', require: 'bx_block_photo_library'
gem 'bx_block_bulk_uploading', '0.0.2', require: 'bx_block_bulk_uploading'
gem 'bx_block_login-3d0582b5', '0.0.10', require: 'bx_block_login'
gem 'bx_block_forgot_password-4de8968b', '0.0.6', require: 'bx_block_forgot_password'
gem 'account_block', '0.0.30'
gem 'bx_block_push_notifications-c0f9e9b7', '0.0.10', require: 'bx_block_push_notifications'
gem 'bx_block_user_status', '0.0.2'
gem 'bx_block_dashboard-9a14cb77', '0.0.3', require: 'bx_block_dashboard'
gem 'bx_block_admin', '0.0.15'
gem 'bx_block_notifsettings-296428d4', '0.0.2', require: 'bx_block_notifsettings'
gem 'bx_block_profile', '0.0.8'
gem 'bx_block_profile_bio', '0.1.9'
gem 'bx_block_email_notifications', '0.0.3'
gem 'bx_block_settings-5412d427', '0.0.3', require: 'bx_block_settings'
gem 'bx_block_notifications-a22eb801', '0.0.5', require: 'bx_block_notifications'
gem 'bx_block_visual_analytics', '0.1.3'
gem 'bx_block_scheduling-d1f08754', '0.0.3', require: 'bx_block_scheduling'
gem 'bx_block_account_groups', '0.0.2'
gem 'bx_block_contact_us-6e0a750f', '0.0.3', require: 'bx_block_contact_us'
gem 'builder_base', '0.0.50'
gem 'devise'
gem 'sassc-rails'
gem 'activeadmin'
gem 'active_admin_role'
gem 'activeadmin_json_editor'
gem 'active_admin_datetimepicker'
gem 'sidekiq_alive'
gem 'sidekiq', '~> 6.1.0'
gem "yabeda-prometheus"    # Base
gem "yabeda-rails"         #API endpoint monitoring
gem "yabeda-http_requests" #External request monitoring
gem "yabeda-puma-plugin"
gem 'yabeda-sidekiq'
gem 'bx_block_cors'
gem 'geocoder'