require_relative 'base'
require 'json'

module Serializer
  module Users
    extend Base
    extend self

    def one(row)
      return nil unless row
      {
  		  id: row[:id],
        email: row[:email],
        name: row[:name],
        created_at: timestamp(row[:created_at]),
        updated_at: timestamp(row[:updated_at])
      }
    end

    def many(rows)
      rows.map{ |r| one(r) }
    end
  end
end
