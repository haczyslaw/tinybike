source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.1'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.13', '< 0.5'
gem 'redis'
gem 'will_paginate'
gem 'haml-rails'
# bootstrap sass gem
gem 'bootstrap-sass', '~> 3.3.6'
# allow bootstrap to add browser vendor prefixes automatically
gem 'autoprefixer-rails'
# jquery-datatables for ajax based tables
gem 'jquery-datatables-rails', '~> 3.3.0'
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
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

group :test do
  gem 'shoulda-matchers', '~> 3.1'
  gem 'rspec-rails'
  # version 0.5 doesn't include pubsub
  gem 'fakeredis', github: 'guilleiguaran/fakeredis', require: 'fakeredis/rspec'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'pry'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end

