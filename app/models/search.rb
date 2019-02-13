class Search < ApplicationRecord

    def search_plats
        plats=Plat.all 
        resto=Restaurant.all
        tag=Category.all
        user=User.all
        dish=plats.where(["lower(titre) LIKE ?","%#{keyword}%"]) if keyword.present?
        dish= plats.joins(:categories).where(["name LIKE ?","%#{category}%"]) if category.present?
        dish=plats.where(["prix >= ?",min_prix]) if min_prix.present?
        dish=plats.where(["prix <= ?",max_prix]) if max_prix.present?
        dish=plats.joins(:user).where("prénom LIKE ?","%#{prénom}%") if prénom.present?
        dish=plats.joins(:restaurant).where("nom LIKE ?","%#{nom}%") if nom.present?
        
        if dish===nil
        dish=plats
        else
        return dish=dish 
        end
    end
end
