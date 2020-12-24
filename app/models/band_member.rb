class BandMember < ApplicationRecord

    belongs_to :user
    belongs_to :band

    validates_uniqueness_of :user_id, scope: :band_id
    # Would love to figure out how to validate uniqueness of state, but allow re-invites of declined.
end
