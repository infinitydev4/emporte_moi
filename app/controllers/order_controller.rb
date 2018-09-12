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
        source:params[:stripeToken]
      )

    charge= Stripe::Charge.create(
        customer: @customer.id,
        amount:989,
        description: "Payement photo de ",
        currency: 'eur',
        receipt_email:params[:stripeEmail] 
    )

    @Panier = Panier.find_by(user_id: current_user.id)
    @Panier.plats.each do |plat|
      PaniersPlat.destroy(PaniersPlat.find_by(panier_id: @Panier.id, plat_id: plat.id).id)
    end
redirect_to root_url

if current_user
  email = { messages: [{
    'From'=> {
        'Email'=> ENV['PRIVATE_EMAIL_ADRESS'],
        'Name'=> 'Emporte-moi'
    },
    'To'=> [
        {
            'Email'=> current_user.email,
            'Name'=> current_user.prénom
        }
    ],
    'Subject'=> 'Facture sur Emporte-moi !',
    'TextPart'=> "Salut #{current_user.prénom.capitalize}. Merci de ton inscription sur le site ! Tu peux à présent commander autant de plats que tu veux !",
    'HTMLPart'=> "<h1>Salut #{current_user.prénom.capitalize}</h1>. <h2>Merci de ton inscription sur le site ! Tu peux à présent commander autant de plats que tu veux !</h2>"
  }]}
  test = Mailjet::Send.create(email)

end
    rescue Stripe::CardError => e
  flash[:alert]=e.message

  end
  
  
  def show
   
  end
 private 
  def charges_params
    params.permit(:stripeEmail, :stripeToken, :order_id)
  end
end
