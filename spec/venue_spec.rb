require "spec_helper"

describe(Venue) do
  it { should have_and_belong_to_many(:bands) }


  it("validates presence of location") do
    new_venue = Venue.new({:location => ""})
    expect(new_venue.save()).to(eq(false))
  end

  it("capitalizes entry when saved") do
    new_venue = Venue.create({:location => "cbgb"})
    expect(new_venue.location()).to(eq("Cbgb"))
  end
end
