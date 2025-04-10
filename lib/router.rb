require_relative './controllers/fx_chains_controller'

class Router
  def self.route(req)
    case [req.request_method, req.path_info]
    when ["GET", "/fx_chains"]
      FxChainsController.index
    when ["POST", "/fx_chains"]
      FxChainsController.create(req)
    else
      not_found
    end
  end

  def self.not_found
    [404, { "Content-Type" => "application/josn" }, ['{"error":"not found"}']]
  end
end
