class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :type
      t.string :name
      t.string :address
      t.string :website
      t.string :phoneNumber
      t.string :email
      t.text :description
      t.string :password_digest

      t.timestamps
    end
  end
end
