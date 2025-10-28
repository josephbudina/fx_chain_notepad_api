module Users
  class Create
    def self.call(params)
      new.call(params)
    end

    def call(params)
      create_user(params)
    end

    def create_user(params)
      User.create(params)
    end
  end
end
