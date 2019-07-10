class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.integer :user_id
      t.integer :place_id
      t.integer :type
      t.string :path

      t.timestamps
    end
  end
end
