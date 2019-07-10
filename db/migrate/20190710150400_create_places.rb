# frozen_string_literal: true

class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.references :user, foreign_key: true, type: :bigint
      t.string :address
      t.references :service, foreign_key: true, type: :bigint
      t.integer :numberRatings
      t.float :mediumRating
      t.string :phoneNumber
      t.time :timeOpen
      t.time :timeClose
      t.text :description

      t.timestamps
    end
    add_index :places, %i[user_id created_at]
  end
end
