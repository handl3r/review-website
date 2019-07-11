class ReNameColumnsType < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :type, :role
    rename_column :photos, :type, :photo_type
  end
end
