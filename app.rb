require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/bands') do
  @bands = Band.all()
  erb(:bands)
end

post("/bands") do
  name = params.fetch('name')
  @band = Band.create({:name => name})
  redirect ('/bands')
end
