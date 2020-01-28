class AddBannerToRegions < ActiveRecord::Migration[5.2]
  def change
    add_column :regions, :banner, :string
  end
end
