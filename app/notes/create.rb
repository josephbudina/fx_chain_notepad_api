module Notes
  class Create
    def self.call(params)
      new.call(params)
    end

    def call(params)
      create_note(params)
    end

    def create_note(params)
      Note.create(params)
    end
  end
end
