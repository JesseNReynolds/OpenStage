class CreateGigs < ActiveRecord::Migration[6.0]
  def change
    create_table :gigs do |t|
      t.integer :band_id
      t.integer :venue_id
      t.string :approval
      t.string :venue_message
      t.datetime  :time
      t.string :duration

      t.timestamps
    end
  end
end
