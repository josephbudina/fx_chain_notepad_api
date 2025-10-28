require 'simplecov'
SimpleCov.start
require './app/conn'
Dir[File.join(__dir__, "app/models/*.rb")].sort.each { |f| require f }
require 'rspec'
require 'pry'
require 'factory_bot'
require 'faker'

RSpec.configure do |config|
	config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
  end

	config.around(:each) do |example|
    DB.transaction(rollback: :always, auto_savepoint: true) do
      example.run
    end
  end
end

