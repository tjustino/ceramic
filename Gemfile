# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.0"

gem "bcrypt"                    # Use ActiveModel has_secure_password
gem "bootsnap", require: false  # Reduces boot times through caching
gem "puma"                      # App server
gem "rails", "~> 6.0.0"         # Full-stack web framework
gem "slim"                      # Template language
gem "sqlite3"                   # Use sqlite3 as the database for Active Record
gem "webpacker"                 # Transpile app-like JavaScript

group :development, :test do
  gem "byebug"                  # Call 'byebug' anywhere in the code to stop it
  gem "capybara"                # Integration testing tool
  gem "selenium-webdriver"      # Tool for writing automated tests of websites
  gem "webdrivers"              # Easy installation and use of chromedriver
end

group :development do
  gem "annotate"                # Annotates ActiveRecord Model, route & fixture
  gem "listen"                  # Listen to file modif and notifies you
  gem "rubocop"                 # Automatic Ruby code style checking tool
  gem "rubocop-md"              # Run Rubocop against your Markdown files
  gem "rubocop-minitest"        # Extension focused on Minitest best practices
  gem "rubocop-performance"     # Check for performance optimizations
  gem "rubocop-rails"           # Automatic Rails code style checking tool
  gem "rubocop-rake"            # RuboCop plugin for Rake
  gem "spring"                  # Keep application running in the background
  gem "spring-watcher-listen"   # Makes spring watch files
  gem "web-console"             # Access an IRB console on exception pages

  # Use Capistrano for deployment
  gem "capistrano"              # Execute commands in parallel on remote machine
  gem "capistrano-bundler"      # Bundler specific tasks for Capistrano v3
  gem "capistrano-rails"        # Rails specific Capistrano tasks
  gem "capistrano-rbenv"        # Idiomatic rbenv support for Capistrano 3
  gem "capistrano3-puma"        # Puma integration for Capistrano 3
end
