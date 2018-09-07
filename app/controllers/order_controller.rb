class OrderController < ApplicationController
  def show
    if current_user.panier.order
      @order = current_user.panier.order
    else
      @order = Order.create(panier_id: current_user.panier.id, user_id: current_user.id)
      current_user.panier.plats.each do |plat|
        OrdersPlat.create(order_id: @order.id, plat_id: plat.id)
      end
    end
  end
end
