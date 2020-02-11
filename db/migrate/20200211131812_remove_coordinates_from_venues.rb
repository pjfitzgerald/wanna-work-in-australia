class RemoveCoordinatesFromVenues < ActiveRecord::Migration[5.2]
  def change
    remove_column :venues, :coordinates
  end
end
