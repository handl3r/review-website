# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true, type: :bigint
      t.references :place, foreign_key: true, type: :bigint
      t.integer :rating
      t.text :comment

      t.timestamps
    end
    add_index :reviews, %i[user_id created_at]
  end
end
