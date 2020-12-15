class CreateBandMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :band_members do |t|

      t.timestamps
    end
  end
end
