class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.integer :company_id
      t.string :address
      t.integer :service_id
      t.integer :numberRatings
      t.float :mediumRating
      t.string :phoneNumber
      t.time :timeOpen
      t.time :timeClose
      t.text :description

      t.timestamps
    end
  end
end
