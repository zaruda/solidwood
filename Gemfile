source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '3.2.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'
# Use mysql as the database for Active Record
# gem 'pg'
gem 'mysql2', '~> 0.5.5'
# Use Puma as the app server
gem 'puma', '~> 3.12'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.2'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
#
gem 'active_material', '~> 1.5', '>= 1.5.2'
gem 'activeadmin', '~> 1.4', '>= 1.4.3'

gem 'aws-sdk', '~> 3.0', '>= 3.0.1'
gem 'aws-sdk-s3', '~> 1.30', '>= 1.30.1'

gem 'babosa', '~> 1.0', '>= 1.0.2'
gem 'bulma-rails', '~> 0.7.2'
gem 'bulma-extensions-rails'
gem 'ckeditor', '~> 5.1', '>= 5.1.1'
gem 'devise', '~> 4.5'
gem 'fog-aws'
gem 'figaro', '~> 1.1', '>= 1.1.1'
gem 'friendly_id', '~> 5.2', '>= 5.2.4'
gem 'gretel'
gem 'inherited_resources', '~> 1.9'
gem 'sitemap_generator', '~> 6.0', '>= 6.0.2'
gem 'simple_form', '~> 4.1'
gem 'jquery-slick-rails', '~> 1.9'
gem 'lazyload-rails', '~> 0.5.0'
gem 'whenever', '~> 0.10.0'
gem "mini_magick"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'heroku-deflater'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
