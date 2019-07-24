require 'rack'
require 'byebug'

class FunApp
  def self.call(env)
    req = Rack::Request.new(env)
    res = Rack::Response.new

    res.status = '200'
    # res.set_header()
    res['Content-Type'] = 'text/html'

    if req.path == '/cat'
      res.write('<img style="height:500px;"src="https://i.redditmedia.com/4f_mapV0HWpmmB_O9gL6oN7didYlC5JfGyp2Z2KEGc8.jpg?s=e2574cde5cae90a3ceaca4a9ea2c3e6b"/>')
    elsif req.path == '/dog'
      res.write('<img src="https://i.redditmedia.com/mQr8eM7ENWOkqxIDm0vKW1YZ7rFevnuB4J1nJbFUyMI.jpg?s=62ad4532bc465a06f42fac795e7d1090"/>')
    else
      res.status = '404'
      res.write("404! I don't have what you're looking for-oh-for!")
    end

    res.finish
  end

end

# FunApp.call

Rack::Server.start(
  app: FunApp,
  Port: 3000
)