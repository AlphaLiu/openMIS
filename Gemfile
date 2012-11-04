require 'rbconfig'
HOST_OS = RbConfig::CONFIG['host_os']
source 'http://ruby.taobao.org'

gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

gem 'rspec-rails' ,:group => [:development,:test]
gem 'pry-rails' ,:group => [:development,:test]
gem 'sqlite3', :group => [:development]
gem 'annotate', :group => [:development]
gem 'pg', :group => [:production]

gem 'faker'
gem 'will_paginate'
gem 'bootstrap-will_paginate'
gem 'slim'
gem 'jquery-rails'

# bootstrap
gem 'bootstrap-sass'

gem 'therubyracer', '>= 0.8.2'
#gem 'rb-fsevent', :group => :development
#gem 'growl', :group => :development
#gem 'guard-pow', :group => :development
#gem 'libnotify', :group => :development
#gem 'rb-inotify', :group => :development

group :test do
  # Pretty printed test output
  gem 'factory_girl_rails', '~>3.2.0'
  gem "capybara"
  gem 'guard-spork'
  gem 'spork'
  gem "guard-rspec"
  gem 'guard-livereload'
  gem 'guard-bundler'
end
