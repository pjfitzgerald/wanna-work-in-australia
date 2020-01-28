class AddDescriptionToRegions < ActiveRecord::Migration[5.2]
  def change
    add_column :regions, :description, :text
  end
end
