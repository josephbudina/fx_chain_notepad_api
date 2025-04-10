require_relative './router'

class App
  def call(env)
    req = Rack::Request.new(env)
    Router.route(req)
  end
end
