module Users
  class Index
    def self.call(params)
      new.call(params)
    end

    def call(params)
      fetch_users(params)
    end

    def fetch_users(params)
      params[:id] ? User.with_pk!(params[:id]) : User.all
    end
  end


end

