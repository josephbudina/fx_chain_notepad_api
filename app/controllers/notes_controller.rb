require 'json'

class NotesController
  def index
    body = [{ id: 1, name: "Dreamy Reverb Chain" }].to_json
    [
      200,
      { "Content-Type" => "application/json" },
      [body]
    ]
  end

  def create(req)
    body = JSON.parse(req.body.read)

    response_body= body.merge(id: rand(1000)).to_json

    [
      201,
      { "Content-Type" => "application/json" },
      [response_body]
    ]
  end
end
