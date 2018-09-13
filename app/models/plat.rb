class Plat < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :restaurant, optional: true
    has_and_belongs_to_many :paniers
    has_and_belongs_to_many :categories
    has_many :paniers_plats
    has_one_attached :photo_plat
    has_and_belongs_to_many :orders
    def self.search
        plats=Plat.all
        users=User.all
        restos=Restaurant.all 
        plats.where("titre like ?", "%#{titre}%") if titre.present?
        plats.where("category like ?", "%#{category}%") if category.present?
        plats.where("prix like ?", "%#{prix}%") if min_prix.present?
        plats.where("prix like ?", "%#{prix}%") if max_prix.present?
        users.where("prénom like ?", "%#{prénom}%") if prénom.present?
        restos.where("nom like ?", "%#{nom}%") if nom.present?
      end
end
