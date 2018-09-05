class Order < ApplicationRecord
    belongs_to :user
    belongs_to :panier
end
