module Serializer
  module Base
    def timestamp(t)
      t&.iso8601
    end
  end
end
