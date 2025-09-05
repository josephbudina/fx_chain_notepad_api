require 'simplecov'
SimpleCov.start
require 'rspec'
require 'pry'
require 'factory_bot'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

