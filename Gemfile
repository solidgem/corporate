source 'https://rubygems.org'
ruby '2.5.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.2.2'
# Use sqlite3 as the database for Active Record

# Use SCSS for stylesheets
gem 'sass-rails'
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
gem 'chartjs-ror'

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
gem 'addressable', require: %w[addressable/uri]

gem 'counter_culture'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Use ActiveModel has_secure_password
gem 'bcrypt'

gem 'enumerize'
gem 'state_machines-activerecord'
gem 'pundit'

gem "refile", require: ['refile/rails', 'refile/simple_form']
gem "refile-mini_magick"
gem "refile-s3"

gem 'github-markdown'

gem 'newrelic_rpm'
gem 'rollbar'
gem 'unicorn'

gem 'pg'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
group :production do
  gem 'rails_12factor'
  gem 'font_assets'
end

group :development, :test do
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'awesome_print'
  gem 'bullet'
end

group :test do
  gem 'factory_girl_rails'
  gem 'factory_girl_sequences'
  gem 'database_cleaner'
  gem 'simplecov', require: false
end
