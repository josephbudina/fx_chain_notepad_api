module Users
  class Show
    def self.call(params)
      new.call(params)
    end

    def call(params)
      fetch_users(params).values
    end

    def fetch_users(params)
      User.with_pk!(params[:id])
    end
  end


end

