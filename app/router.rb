require_relative './controllers/notes_controller'

class Router
  def self.route(req)
    case [req.request_method, req.path_info]
    when ["GET", "/fx_chains"]
      NotesController.index
    when ["POST", "/fx_chains"]
      NotesController.create(req)
    else
      not_found
    end
  end

  def self.not_found
    [404, { "Content-Type" => "application/josn" }, ['{"error":"not found"}']]
  end
end
