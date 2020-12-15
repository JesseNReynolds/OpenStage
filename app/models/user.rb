class User < ApplicationRecord

    has_secure_password
    
    has_many :band_members
    has_many :bands, through: :band_members

end
