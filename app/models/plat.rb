class Plat < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :restaurant, optional: true
    has_and_belongs_to_many :paniers
    has_many :paniers_plats
    has_one_attached :photo_plat
    has_and_belongs_to_many :orders
end
