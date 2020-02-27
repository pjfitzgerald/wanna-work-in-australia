class AddFieldsToApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :applications, :length_of_stay, :integer
    add_column :applications, :country_of_origin, :string
  end
end
