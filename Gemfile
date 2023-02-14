source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.4'

gem 'rails', '~> 5.2.8'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'capybara'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'launchy'
  gem 'orderly'
  gem 'pry'
  gem 'pry-rails' #added [https://rubygems.org/gems/pry-rails/versions/0.3.9]
  gem 'rspec-rails'
  gem 'simplecov'
  gem 'net-http' #added [https://github.com/ruby/net-http]
  # gem 'faker' #added [https://github.com/faker-ruby/faker]
  # gem 'factorybot' #added [https://github.com/thoughtbot/factory_bot_rails]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
