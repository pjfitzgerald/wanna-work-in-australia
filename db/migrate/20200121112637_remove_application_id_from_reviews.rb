class RemoveApplicationIdFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :reviews, :applications
    remove_column :reviews, :application_id
  end
end
