require 'simplecov'
SimpleCov.start
require './app/models'
require 'rspec'
require 'pry'
require 'factory_bot'
require 'faker'

RSpec.configure do |config|
	config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
  end
end

