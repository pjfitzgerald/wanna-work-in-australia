class AddBannerToResources < ActiveRecord::Migration[5.2]
  def change
    add_column :resources, :banner, :string
  end
end
