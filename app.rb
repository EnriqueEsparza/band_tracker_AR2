require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @bands = Band.all()
  @venues = Venue.all()
  erb(:index)
end

get("/bands") do
  @bands = Band.all()
  erb(:bands)
end

get("/venues") do
  @venues = Venue.all()
  erb(:venues)
end

post("/bands") do
  name = params.fetch("name")
  band = Band.new({:name => name, :id => nil})
  band.save()
  @bands = Band.all()
  erb(:bands)
end

post("/venues") do
  location = params.fetch("location")
  venue = Venue.new({:location => location, :id => nil})
  venue.save()
  @venues = Venue.all()
  erb(:venues)
end

get("/bands/:id") do
  @band = Band.find(params.fetch("id").to_i())
  @venues = Venue.all()
  erb(:band_info)
end

get("/venues/:id") do
  @venue = Venue.find(params.fetch("id").to_i())
  @bands = Band.all()
  erb(:venue_info)
end

patch("/bands/:id") do
  band_id = params.fetch("id").to_i()

  @band = Band.find(band_id)
  venue_ids = params.fetch("venue_ids")
  @band.update({:venue_ids => venue_ids})
  @venues = Venue.all()
  erb(:band_info)
end

delete("/bands/:id") do
  @band = Band.find(params.fetch("id").to_i())
  @band.delete()
  @bands = Band.all()
  redirect('/')
end

patch("/venues/:id") do
  venue_id = params.fetch("id").to_i()
  @venue = Venue.find(venue_id)
  band_ids = params.fetch("band_ids")
  @venue.update({:band_ids => band_ids})
  @bands = Band.all()
  erb(:venue_info)
end

get("/bands/:id/edit") do
  @band = Band.find(params.fetch("id").to_i())
  erb(:band_name)
end

patch("/bands/:id/edit") do

    name = params.fetch("name")
    band_id = params.fetch("id").to_i()
    @band = Band.find(band_id)
    @band.update({:name => name})
    @venues = Venue.all()
    redirect("/")
  end
