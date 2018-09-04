class Plat < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :paniers
    has_many :panier_plats
end
