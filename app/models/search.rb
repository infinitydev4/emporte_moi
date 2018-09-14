class Search < ApplicationRecord

    def search_plats
        plats=Plat.all 
        resto=Restaurant.all
        tag=Category.all
        user=User.all
        dish=plats.where(["titre LIKE ?","%#{keyword}%"]) if keyword.present?
        dish=tag.where(["name LIKE ?","%#{category}%"]).plats if category.present?
        dish=plats.where(["prix >= ?",min_prix]) if min_prix.present?
        dish=plats.where(["prix >= ?",max_prix]) if max_prix.present?
        dish=resto.where("nom LIKE ?","%#{nom}%").plats if nom.present?
        dish=user.where("nom LIKE ?","%#{prénom}%").plats if nom.present?

        return dish
    end
end
