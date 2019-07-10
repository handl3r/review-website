class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.references :user, foreign_key: true, type: :bigint
      t.references :place, foreign_key: true, type: :bigint
      t.integer :type
      t.string :path

      t.timestamps
    end
    add_index :photos, %i[place_id created_at]
  end
end
