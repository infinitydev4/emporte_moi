class HomeController < ApplicationController
  def index
    @user = User.new
  end

  def ajout_panier
    PaniersPlat.create(panier_id: current_user.panier.id, plat_id: params[:id])
    redirect_to paniers_path
  end

  def contact
  end

  def cgu
  end
end
