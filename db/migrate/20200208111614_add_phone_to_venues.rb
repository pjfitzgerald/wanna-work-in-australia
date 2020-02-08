class AddPhoneToVenues < ActiveRecord::Migration[5.2]
  def change
    add_column :venues, :phone, :integer
  end
end
