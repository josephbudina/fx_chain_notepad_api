class App
  def call(env)
    req = Rack::Request.new(env)

    if req.path == "/ping"
      [200, { "Content-Type" => "application/json" }, ['{"message": "pong"}']]
    else
      [404, { "Content-Type" => "application/json" }, ['{"error": "not found"}']]
    end
  end
end
