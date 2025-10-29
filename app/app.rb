require "roda"
require 'sequel'
require_relative 'conn'
require_relative 'models/user'
require_relative 'users/index'

# Dir[File.join(__dir__, "routes/*.rb")].sort.each { |f| require_relative f }

class App < Roda

  route do |r|
    # GET / request
    r.root do
      "home"
    end

    r.on "v1" do
      r.on "users", Integer do |user_id|
        r.get do
          "#{Users::Index.(id: user_id)}"
        end
      end
    end
  end
end
