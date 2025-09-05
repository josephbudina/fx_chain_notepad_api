require 'json'

class NotesController
  def index
    DB[:notes].all
  end

  def create(req)
  end
end
