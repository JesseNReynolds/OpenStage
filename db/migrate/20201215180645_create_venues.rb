class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :address
      t.text :description
      

      t.timestamps
    end
  end
end
