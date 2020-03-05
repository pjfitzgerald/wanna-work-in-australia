class AddBannerToVenues < ActiveRecord::Migration[5.2]
  def change
    add_column :venues, :banner, :string
  end
end
