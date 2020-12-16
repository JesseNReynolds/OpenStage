class Venue < ApplicationRecord

    has_secure_password
    
    has_many :gigs
    has_many :bands, through: :gigs

    validates :name, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :address, presence: true
    validates :address, uniqueness: true
    validates :city, presence: true
    validates :state, presence: true

    def self.is_logged_in?(session)
        !!session[:venue_id]
    end

    def self.current_venue_id(session)
        session[:venue_id]
    end

    def self.current_venue(session)
        Venue.find(session[:venue_id])
    end

end
