class Band < ApplicationRecord

    belongs_to :leader, class_name: "User", foreign_key: :leader_id
    has_many :band_members
    has_many :users, through: :band_members
    has_many :gigs

    validates :name, presence: true

end
