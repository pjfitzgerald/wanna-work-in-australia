class AddLinkToVenues < ActiveRecord::Migration[5.2]
  def change
    add_column :venues, :link, :string
  end
end
