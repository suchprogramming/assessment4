require('bundler/setup')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/bands') do
  @bands = Band.all()
  erb(:bands)
end

post('/bands') do
  band_name = params.fetch('band_name')
  @band = Band.create({:name => band_name})
  redirect ('/bands')
end

delete('/bands') do
  Venue.delete_all()
  Band.delete_all()
  redirect ('/bands')
end

get('/bands/:id') do
  @venues = Venue.all()
  @band = Band.find(params.fetch('id').to_i())
  erb(:band_venues)
end

patch('/bands/:id') do
  @bands = Band.all()
  new_band_name = params.fetch('new_band_name')
  id = params.fetch('id').to_i()
  @band = Band.find(id)
  @band.update({:name => new_band_name})
  redirect('/bands')
end

post("/bands/venues/:id") do
  band_id = params.fetch("id").to_i()
  @band = Band.find(band_id)
  venue_ids = params.fetch("venue_ids")
  @band.venues().<<(Venue.find(venue_ids))
  @venues = Venue.all()
  erb(:band_venues)
end

delete('/bands/:id') do
  @bands = Band.all()
  id = params.fetch('id').to_i()
  Band.find(id).delete()
  redirect('/bands')
end

post('/venues') do
  venue_name = params.fetch('venue_name')
  @venue = Venue.create({:name => venue_name})
  redirect('/bands')
end
