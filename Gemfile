source 'https://rubygems.org'
ruby "2.3.2"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.2.4'
# Use PostgreSQL as the database for Active Record
gem 'pg', '~> 0.18.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

gem 'dotenv-rails', '~> 2.0.2'
gem 'omniauth', '~> 1.7.1'
gem 'omniauth-google-oauth2', '~> 0.5.2'
gem 'rails_config', '~> 0.4.2'
gem 'slack-notifier', '~> 1.4.0'

# bundle exec rake doc:rails generates the API under doc/api.
group :doc do
  gem 'sdoc', '~> 0.4.0'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'
gem 'puma', '~> 2.14.0'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-byebug'
  gem 'hirb'
  gem 'hirb-unicode'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'rails-erd'

  gem 'factory_bot_rails'
  gem 'rspec-rails'
end

group :test do
  gem 'shoulda-matchers', '~> 2.8.0'
  gem 'capybara', '~> 2.5.0'
  gem 'poltergeist', '~> 1.6.0'
  gem 'database_cleaner', '~> 1.5.0'
  gem 'webmock', '~> 1.22.3'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  # To use Heroku for preview
  gem 'rails_12factor', '~> 0.0.3'
end
