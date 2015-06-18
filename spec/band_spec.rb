require "spec_helper"

  describe(Band) do
      it { should have_and_belong_to_many(:venues) }


      it("validates presence of name") do
        new_band = Band.new({:name => ""})
        expect(new_band.save()).to(eq(false))
      end

      it("capitalizes entry when saved") do
        new_band = Band.create({:name => "winger"})
        expect(new_band.name()).to(eq("Winger"))
      end




  end
