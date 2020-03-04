class AddSuburbAndPostcodeToVenues < ActiveRecord::Migration[5.2]
  def change
    add_column :venues, :suburb, :string
    add_column :venues, :postcode, :string
  end
end
