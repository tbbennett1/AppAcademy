require 'rack'
require 'byebug'

less_basic_app = Proc.new do
  res = Rack::Response.new
  res.status = 200
  res.set_header('Content-Type', 'text/html')
  res.write('not so basic rack app')
  res.finish
end

# Rack::Server.start(
#   app: less_basic_app,
#   Port: 3000
# )



######### 🍪🍪🍪

cookie_party_app = Proc.new do |env|
  req = Rack::Request.new(env)
  # debugger
  res = Rack::Response.new
  res.write("<h1>COOKIE PARTY</h1>")
  if req.cookies["cookie_party"]
    res.write("<h2>We have cookies for our party!</h2>")
  else
    res.write("<h2>Aw, there's no cookies! Refresh to make some.</h2>")
  end
  res.set_cookie("cookie_party", { value: true })
  # res.set_header('Set-Cookie', 'true')
  res.finish
end

Rack::Server.start(
  app: cookie_party_app,
  Port: 3000
)