class User < ApplicationRecord

    has_secure_password
    
    has_many :band_members
    has_many :bands, through: :band_members
    has_many :gigs, through: :bands

    validates :name, presence: true 
    validates :email, presence: true 
    validates :email, uniqueness: true

end
