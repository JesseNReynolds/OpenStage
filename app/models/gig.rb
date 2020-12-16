class Gig < ApplicationRecord

    # CHANGE THESE! REMOVE OPTIONAL TRUE FROM VENUE!!!
    belongs_to :venue, optional: true
    belongs_to :band, optional: true
    
end
