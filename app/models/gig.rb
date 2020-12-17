class Gig < ApplicationRecord


    belongs_to :venue
    belongs_to :band, optional: true
    
    
end
