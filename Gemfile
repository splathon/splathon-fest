ruby '2.3.0'

source 'https://rubygems.org' do
  gem 'coffee-rails', '~> 4.1.0'
  gem 'config'
  gem 'enum_help'
  gem 'jbuilder', '~> 2.0'
  gem 'jquery-rails'
  gem 'mysql2', '>= 0.3.18', '< 0.5'
  gem 'puma'
  gem 'rails', '>= 5.0.0.beta1', '< 5.1'
  gem 'slim-rails'
  gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
  gem 'uglifier', '>= 1.3.0'
  gem 'virtus'

  group :development do
    gem 'byebug', group: :test
    gem 'pry-byebug',         group: :test
    gem 'pry-stack_explorer', group: :test
    gem 'pry-rails',          group: :test
    gem 'rubocop', require: false
    gem 'web-console', '~> 3.0'
    gem 'yard', group: :doc
  end

  group :test do
    gem 'database_rewinder'
    gem 'factory_girl_rails', group: :development
    gem 'ffaker',             group: :development
    gem 'rails-controller-testing'
    gem 'rspec-core', github: 'rspec/rspec-core', branch: 'master'
    gem 'rspec-expectations', github: 'rspec/rspec-expectations', branch: 'master'
    gem 'rspec-mocks', github: 'rspec/rspec-mocks', branch: 'master'
    gem 'rspec-rails', github: 'rspec/rspec-rails', branch: 'master'
    gem 'rspec-support', github: 'rspec/rspec-support', branch: 'master'
    gem 'simplecov', require: false
  end
end
