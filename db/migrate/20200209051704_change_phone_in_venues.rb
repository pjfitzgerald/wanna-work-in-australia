class ChangePhoneInVenues < ActiveRecord::Migration[5.2]
  def change
    change_column :venues, :phone, :string
  end
end
