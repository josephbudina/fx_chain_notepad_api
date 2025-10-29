module Users
  class Index
    def self.call(params)
      new.call(params)
    end

    def call(params)
      update_user(params)
    end

    def update_user(params)
      User.where(id: params[:id]).update
    end
  end


end

