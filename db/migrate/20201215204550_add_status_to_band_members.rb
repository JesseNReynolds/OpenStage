class AddStatusToBandMembers < ActiveRecord::Migration[6.0]
  
  def change
    add_column :band_members, :status, :string
  end

end
