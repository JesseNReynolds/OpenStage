class Gig < ApplicationRecord


    belongs_to :venue
    belongs_to :band, optional: true
    
    validates :duration, numericality: { greater_than_or_equal_to: 30, less_than_or_equal_to: 180 }
    validates :duration, presence: true

    def self.all_available
        Gig.all.select do |gig|
            gig.band_id == nil && gig.time > DateTime.now
        end
    end
end
