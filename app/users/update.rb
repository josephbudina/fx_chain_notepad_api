module Notes
  class Index
    def self.call(params)
      new.call(params)
    end

    def call(params)
      fetch_notes(params)
    end

    def fetch_notes(params)
      params[:id] ? Note.with_pk!(params[:id]) : Note.all
    end
  end


end

