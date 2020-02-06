class AddLinkToRegions < ActiveRecord::Migration[5.2]
  def change
    add_column :regions, :link, :string
  end
end
