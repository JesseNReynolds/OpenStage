class Band < ApplicationRecord

    belongs_to :leader, class_name: "User", foreign_key: :leader_id
    has_many :band_members
    has_many :users, through: :band_members
    has_many :gigs

    validates :name, presence: true

    def empty_roster
        self.band_members.each do |band_member|
            band_member.delete
        end
    end

    def unclaim_all_gigs
        self.gigs.each do |gig|
            gig.band_id = nil
            gig.status = nil
            gig.save
        end
    end

    def clear_associations_before_deletion
        self.empty_roster
        self.unclaim_all_gigs
    end

end
