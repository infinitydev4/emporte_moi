class HomeController < ApplicationController
  def index
    @user = User.new
  end

  def ajout_panier
    PaniersPlat.create(panier_id: current_user.panier.id, plat_id: params[:id], quantité: 1)
    redirect_to paniers_path
  end

  def contact
  end

  def cgu
  end

  def profil
    @user = current_user
  end

  def mes_commandes
    @user = current_user
  end

  def mon_restaurant
    @resto = current_restaurant
  end

  def mes_plats
    @resto = current_restaurant
  end
end
