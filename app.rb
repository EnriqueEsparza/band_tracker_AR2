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
