class CreateBands < ActiveRecord::Migration[6.0]
  def change
    create_table :bands do |t|
      t.integer :leader_id
      t.text :bio
      t.string :name

      t.timestamps
    end
  end
end
