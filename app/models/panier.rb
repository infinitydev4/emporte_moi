class Panier < ApplicationRecord
    has_and_belongs_to_many :plats
    has_many :paniers_plats
    belongs_to :user
    has_one :order
end
