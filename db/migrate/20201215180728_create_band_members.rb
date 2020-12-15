class CreateBandMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :band_members do |t|
      t.integer :band_id
      t.integer :musician_id
      
      t.timestamps
    end
  end
end
