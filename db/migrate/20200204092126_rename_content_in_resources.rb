class RenameContentInResources < ActiveRecord::Migration[5.2]
  def change
    rename_column :resources, :content, :description
  end
end
