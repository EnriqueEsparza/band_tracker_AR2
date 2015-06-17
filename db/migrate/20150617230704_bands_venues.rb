class BandsVenues < ActiveRecord::Migration
  def change
  


    create_table(:bands_venues) do |t|
      t.belongs_to(:band)
      t.belongs_to(:venue)

      t.timestamps()
    end

  end
end
