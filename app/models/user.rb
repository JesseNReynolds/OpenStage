class User < ApplicationRecord

    has_secure_password
    
    has_many :band_members
    has_many :bands, through: :band_members
    has_many :gigs, through: :bands

    validates :name, presence: true 
    validates :email, presence: true 
    validates :email, uniqueness: true

    def self.is_logged_in?(session)
        !!session[:user_id]
    end

    def self.current_user_id(seesion)
        session[:user_id]
    end

    def self.current_user(seesion)
        User.find(session[:user_id])
    end
end
