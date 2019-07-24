require 'rack'
require 'byebug'

most_basic_app = Proc.new do
  puts "got a request!"
  [
    '200', 
    {'Content-Type' => 'text/html'}, 
    ['This is the most basic rack app.']
  ]
end

# most_basic_app.call
# Rack::Server.start({app: most_basic_app, Port: 3000})


most_basic_redirect_app = Proc.new do
  [
    '302',
    {'Content-Type' => 'text/html', 'Location' => 'https://www.google.com'},
    []
  ]
end
Rack::Server.start({ app: most_basic_redirect_app, Port: 3000 })