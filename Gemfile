source 'https://rubygems.org'

gem 'rake'

group :test, :integration do
  gem 'berkshelf', '~> 2.0.14'
end

group :test do
  gem 'chefspec', '~> 7.1.0'
  gem 'foodcritic', '~> 11.4.0'
  gem 'rubocop', '~> 0.50.0'
end

group :integration do
  gem 'busser-serverspec', '~> 0.2.6'
  gem 'kitchen-vagrant', '~> 0.14'
  gem 'test-kitchen', '~> 1.1'
end

# group :development do
#   gem 'guard',         '~> 2.0'
#   gem 'guard-kitchen'
#   gem 'guard-rubocop', '~> 1.0'
#   gem 'guard-rspec',   '~> 3.0'
#   gem 'rb-inotify',    :require => false
#   gem 'rb-fsevent',    :require => false
#   gem 'rb-fchange',    :require => false
# end
