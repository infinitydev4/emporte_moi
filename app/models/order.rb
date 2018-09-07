class Order < ApplicationRecord
    belongs_to :user
    belongs_to :panier
    has_and_belongs_to_many :plats
end
