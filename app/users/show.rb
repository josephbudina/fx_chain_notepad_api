require_relative "../serializer/users"
require 'json'

module Users
  class Show

    def self.call(params)
      new.call(params)
    end

    def call(params)
      user = fetch_user(params).values

      serialize(user)
    end

    def fetch_user(params)
      user = User.with_pk!(params[:id])
    end

    def serialize(user)
      json = ::Serializer::Users.one(user)

      return JSON.pretty_generate(data: json)
    end
  end
end
