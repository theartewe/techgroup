source 'http://rubygems.org'


gem 'rails', '3.1.1'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# ORM
#gem 'bson',     '1.3.1'
gem 'bson_ext'#, '~> 1.3.1'
gem 'mongoid', '~> 2.2'

# Media storage
gem 'aws-s3'
gem 'fog'
gem 'asset_sync'

# Image processing
gem 'carrierwave'
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'
gem 'rmagick'

# Cache
gem 'rack-cache' #, :require => 'rack/cache'
gem 'dalli'

# Active Admin
gem 'activeadmin'
gem 'meta_search', '>= 1.1.0.pre'
#gem 'sass-rails', "  ~> 3.1.0"
gem 'sass-rails',   '~> 3.1.4'


# Tools
gem 'kaminari'


group :development do
  gem 'heroku-rails'
  gem 'unicorn'
end

group :production do
  gem 'thin'
end
