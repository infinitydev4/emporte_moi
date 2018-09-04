class Panier < ApplicationRecord
    has_and_belongs_to_many :plats
    has_many :panier_plats
    belongs_to :user
end
