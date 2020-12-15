class CreateGigs < ActiveRecord::Migration[6.0]
  def change
    create_table :gigs do |t|

      t.timestamps
    end
  end
end
