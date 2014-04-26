require "./app.rb"

map "/css" do
  run Rack::Directory.new("./public/css")
end

map "/js" do
  run Rack::Directory.new("./public/js")
end

run Server.new
