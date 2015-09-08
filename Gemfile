source 'https://rubygems.org'
ruby '2.2.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.2'
# Use sqlite3 as the database for Active Record

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'rails-i18n'

gem 'haml'
gem 'bootstrap-sass'
gem 'bootstrap-select-rails'
gem 'momentjs-rails'
gem 'bootstrap3-datetimepicker-rails'

gem 'validates'

gem 'simple_form'
gem 'virtus'

gem 'figaro'

gem 'responders'
gem 'ransack'
gem 'usefull_scopes'
gem 'squeel'
gem 'kaminari'
gem 'bootstrap-kaminari-views'

gem 'counter_culture'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

gem 'enumerize'
gem 'state_machines-activerecord'
gem 'pundit'

gem "refile", require: "refile/rails", github: 'refile/refile', ref: 'f37b5c55' #TODO: update when it released
gem "refile-mini_magick"
gem "refile-s3"

gem 'github-markdown'

gem 'newrelic_rpm'
gem 'rollbar'
gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development, :test do
  gem 'sqlite3'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 3.0.0'
  gem 'awesome_print'
end

group :test do
  gem 'factory_girl_rails'
  gem 'factory_girl_sequences'
  gem 'database_cleaner'
  gem 'simplecov', require: false
end
