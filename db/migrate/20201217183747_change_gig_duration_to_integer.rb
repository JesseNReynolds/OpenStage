class ChangeGigDurationToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :gigs, :duration, :integer, using: 'duration::integer'
  end
end
