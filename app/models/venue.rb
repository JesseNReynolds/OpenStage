class Venue < ApplicationRecord

    has_secure_password
    
    has_many :gigs
    has_many :bands, through: :gigs

end
