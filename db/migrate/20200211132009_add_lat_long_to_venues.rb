class AddLatLongToVenues < ActiveRecord::Migration[5.2]
  def change
    add_column :venues, :latitude, :decimal
    add_column :venues, :longitude, :decimal
  end
end
