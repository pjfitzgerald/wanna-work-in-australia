class ChangeLengthOfStayInApplications < ActiveRecord::Migration[5.2]
  def change
    change_column :applications, :length_of_stay, :string
  end
end
