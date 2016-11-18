source 'https://rubygems.org'
ruby '2.3.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# Use shoulda to augment rspec tests
gem 'shoulda'
# Use TinyMCE to rich text edit
gem 'tinymce-rails', :git => 'git://github.com/spohlenz/tinymce-rails.git'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'bootstrap-sass', '~> 3.2.0'
gem 'autoprefixer-rails'

# sweet alert
gem 'sweet-alert'

# font awesome
gem "font-awesome-rails"

# date picker
gem 'bootstrap-datepicker-rails'
# image uploading
gem "carrierwave"
gem "mini_magick"
gem "fog"

#user authentication
gem 'devise'
gem 'omniauth'
gem 'omniauth-google'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  gem 'autotest'
  gem 'jasmine-rails' # if you plan to use JavaScript/CoffeeScript
  gem 'rspec-rails', '3.3.2'
  gem 'timecop'

end

group :test do
#  gem 'simplecov', '0.11.1', :require => false
  gem 'test-unit'
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels' # basic imperative step defs
  gem 'database_cleaner' # required by Cucumber
  gem 'autotest-rails'
  gem 'factory_girl_rails' # if using FactoryGirl
  gem 'metric_fu'        # collect code metrics
  gem 'rake'
  gem "codeclimate-test-reporter", :require => nil
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
  
group :production do
  gem 'pg' # for Heroku deployment
  gem 'rails_12factor'
  
end

