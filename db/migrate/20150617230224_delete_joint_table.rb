class DeleteJointTable < ActiveRecord::Migration
  def change
    drop_table :bands_venues
  end
end
