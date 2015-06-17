class CreateVenuesAndJointTable < ActiveRecord::Migration
  def change
      create_table(:venues) do |t|
        t.column(:location, :string)

        t.timestamps()
      end

      create_table(:bands_venues) do |t|
        t.column(:band_id, :integer)
        t.column(:venue_id, :integer)

        t.timestamp()
      end
  end
end
