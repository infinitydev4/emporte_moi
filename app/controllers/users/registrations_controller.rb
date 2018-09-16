# frozen_string_literal: true
require 'dotenv'
Dotenv.load

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super
    current_user.image_profile.attach(
      io: File.open("app/assets/images/avatar.jpg"),
      filename: "avatar.jpg"
    )
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
        'Subject'=> 'Bienvenue sur Emporte-moi !',
        'HTMLPart'=> "<div class='title s-box no-border normal-text'>
          Nous vous remercions de votre inscription !
        </div>

        <div class='content s-box no-border'>
          <div class='normal-text small'>
            Bonjour !<br />
            <br />
            Nous vous remercions de votre inscription sur <strong>Emporte Moi</strong>. <br />
            Vous trouverez les d&eacute;tails de votre inscription ci-dessous.

            <div class='line'>
              <div class='left'>
                Vos informations clients :<br />
                nom : <strong>#{current_user.nom}</strong><br />
                Prenom : <strong>#{current_user.prénom}</strong><br />
                Email : <strong>#{current_user.email}</strong><br />
                Telephone : <strong>#{current_user.téléphone}</strong><br />
                      </div>


            <div class='bottom s-box no-border normal-text small'>
              Vérifiez ces informations. Vous pouvez les corriger sur votre espace membre si elles comportent des erreurs.<br />
            N'hésitez pas &agrave; nous écrire si vous avez la moindre
              question.<br />
              <br />
              Salutations !<br />
              Du gros Love de la part de toute l'équipe <strong>Emporte Moi</strong>
            </div>"
      }]}
      test = Mailjet::Send.create(email)

    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  def destroy
    Order.destroy(current_user.orders.pluck(:id))
    Panier.destroy(current_user.panier.id)
    Plat.destroy(current_user.plats.pluck(:id))
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
