require "dotenv"
Dotenv.load
class HomeController < ApplicationController
  def index
    @user = User.new
  end

  def ajout_panier
    pan = PaniersPlat.find_by(panier_id: current_user.panier.id, plat_id: params[:id])
    if pan
      pan.update(quantité: pan.quantité + 1)
    else
      PaniersPlat.create(panier_id: current_user.panier.id, plat_id: params[:id], quantité: 1)
    end
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
    @user = current_user if current_user
    @resto = current_restaurant if current_restaurant
  end

  def particulier
    @user = User.find_by(nom:params[:name])
    @apikey = ENV['API_KEY']
  end
  def restaurant
    @resto = Restaurant.find_by(nom: params[:name])
    @apikey = ENV['API_KEY']
  end
end
