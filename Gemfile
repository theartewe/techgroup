source 'http://rubygems.org'

gem 'rails', '3.2.3'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier',     '>= 1.0.3'
end

gem 'jquery-rails'

# ORM
gem 'bson_ext'
gem 'mongoid'

# Media storage
gem 'aws-s3'
gem 'fog'
gem 'asset_sync'

# Image processing
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'
gem 'rmagick'

# Cache
gem 'rack-cache' #, :require => 'rack/cache'
gem 'dalli'

gem "formtastic", "~> 2.1.1"

# Active Admin 
gem 'activeadmin-mongoid'

# Pagination
gem 'kaminari'

group :development do
  gem 'foreman'
  gem 'heroku-rails'
  gem 'unicorn'
end

group :production do
  gem 'thin'
end
