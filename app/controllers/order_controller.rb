class OrderController < ApplicationController
  def new
     if current_user.panier.order
    @order = current_user.panier.order
  else
    @order = Order.create(panier_id: current_user.panier.id, user_id: current_user.id)
    current_user.panier.plats.each do |plat|
      OrdersPlat.create(order_id: @order.id, plat_id: plat.id)
    end
  end
    
  end
 
  def create
   
    @customer = Stripe::Customer.create(
        email:params[:stripeEmail],
        source:params[:stripeToken],
      )

    charge= Stripe::Charge.create(
        customer: @customer.id,
        amount:989,
        description: "Payement photo de ",
        currency: 'eur',
        receipt_email:params[:stripeEmail] ,
    )

    
@order.plats.destroy_all


  end
  
  
  def show
   
  end

end
