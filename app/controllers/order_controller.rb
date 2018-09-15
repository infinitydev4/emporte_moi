class OrderController < ApplicationController
  def new
    @panier = current_user.panier
    @somme = @panier.plats.map{|plat| plat.prix*(@panier.paniers_plats.find_by(plat_id: plat.id).quantité)}.sum

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
    @user = current_user
    @panier = current_user.panier
    @somme = @panier.plats.map{|plat| plat.prix*(@panier.paniers_plats.find_by(plat_id: plat.id).quantité)}.sum
    @customer = Stripe::Customer.create(
        email:params[:stripeEmail],
        source:params[:stripeToken]
      )

    charge= Stripe::Charge.create(
        customer: @customer.id,
        amount:@somme.to_i*100,
        description: "Payement photo de ",
        currency: 'eur',
        receipt_email:params[:stripeEmail]
    )

    @body = @user.orders.first.plats.map{ |plat|
      "<tr><td>#{plat.titre}</td><td><#{plat.prix}></td><td>#{@panier.paniers_plats.first.quantité}</td><td>#{(plat.prix)*(1)}</td></tr>"}



    email = { messages: [{
      'From'=> {
          'Email'=> ENV['PRIVATE_EMAIL_ADRESS'],
          'Name'=> 'Emporte-moi'
      },
      'To'=> [
          {
              'Email'=> @user.email,
              'Name'=> @user.prénom
          }
      ],
      'Subject'=> 'Facture sur Emporte-moi !',
      'HTMLPart'=> "
        <div class='title s-box no-border normal-text'>
          Nous vous remercions de votre commande !
        </div>

        <div class='content s-box no-border'>
          <div class='normal-text small'>
            Bonjour !<br />
            <br />
            Nous vous remercions de votre commande sur <strong>Emporte Moi</strong>. <br />
            Vous trouverez les détails de votre commande ci-dessous.

            <div class='line'>
              <div class='left'>
                Numéro de commande : <strong>#{@user.orders.first.id}</strong>
              </div>

              <div class='right'>

              </div>
            </div>
          </div>

          <div class='shipping-box full-width normal-text small'>


          <table class='s-table c2'>
            <tbody>
              <tr>
                <th>Nom du Produit</th>

                <th>Prix</th>

                <th width='15%'>Qté</th>

                <th width='15%'>Total</th>
              </tr>
              #{@body}
              <tr>
                <td colspan='2'></td>

                <td> TOTAL</td>

        <td><strong>#{@user.orders.first.plats.map{|plat| plat.prix*(@panier.paniers_plats.first.quantité)}.sum} € </strong></td>
              </tr>
            </tbody>
          </table>
        </div>

        <div class='bottom s-box no-border normal-text small'>
          N'ésitez pas à nous écrire si vous avez la moindre
          question.<br />
          <br />
          Salutations !<br />
          <strong>Emporte Moi</strong>
        </div>
      "
    }]}
    test = Mailjet::Send.create(email)
    @panier.plats.each do |plat|
      @panier.paniers_plats.destroy_all
    end

    redirect_to root_path
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
