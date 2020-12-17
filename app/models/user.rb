class User < ApplicationRecord

    has_secure_password
    
    has_many :lead_bands, class_name: "Band", foreign_key: :leader_id
    has_many :band_members
    has_many :bands, through: :band_members
    has_many :gigs, through: :bands

    validates :name, presence: true 
    validates :email, presence: true 
    validates :email, uniqueness: true

end
