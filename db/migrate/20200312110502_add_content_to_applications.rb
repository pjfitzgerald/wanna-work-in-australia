class AddContentToApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :applications, :content, :text
  end
end
