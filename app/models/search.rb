class Search < ApplicationRecord

    def search_plats
        plats=Plat.all 
        resto=Restaurant.all
        tag=Category.all
        user=User.all
        dish=plats.where(["lower(titre) LIKE ?","%#{keyword}%"]) if keyword.present?
        dish=plats.where(["name LIKE ?","%#{category}%"]) if category.present?
        dish=plats.where(["prix >= ?",min_prix]) if min_prix.present?
        dish=plats.where(["prix <= ?",max_prix]) if max_prix.present?
        dish=plats.joins(:user).where("nom LIKE ?","%#{prénom}%") if prénom.present?
        dish=plats.join(:restaurant).where("nom LIKE ?","%#{nom}%")[0] if nom.present?
        

        return dish
    end
end
