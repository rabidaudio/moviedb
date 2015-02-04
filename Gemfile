source 'https://rubygems.org'

gem 'rails', '4.2.0'

gem 'pg', '~> 0.18.1'

gem 'execjs'
gem 'therubyracer', platforms: :ruby

# Assets
gem 'uglifier', '>= 1.3.0'
gem 'sass-rails', '~> 5.0'

gem 'skeleton-rails', git: "git://github.com/phallstrom/skeleton-rails.git" #'~> 0.1.0'
# gem "less-rails"
# gem "twitter-bootstrap-rails", :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'

gem 'slim-rails'
gem 'markdown-rails'
gem 'redcarpet'
# Use CoffeeScript for .coffee assets and views
# gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
# gem 'sdoc', '~> 0.4.0', group: :doc

gem 'bcrypt', '~> 3.1.7'

# gem 'uuid'
# gem 'activeuuid'
# gem 'activeuuid', git: 'https://github.com/jashmenn/activeuuid.git'

# Use Unicorn as the app server
# gem 'unicorn'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'omdb', git: "git://github.com/rabidaudio/omdb.git" #my version

gem 'omniauth-facebook'

gem 'figaro'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  
  gem 'guard-livereload'
  gem "rack-livereload"

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  #heroku thing
  gem 'rails_12factor'
end

