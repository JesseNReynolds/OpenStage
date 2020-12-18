class ChangeMusicianidToUseridOnBandMembers < ActiveRecord::Migration[6.0]
  def change
    rename_column :band_members, :musician_id, :user_id
  end
end
