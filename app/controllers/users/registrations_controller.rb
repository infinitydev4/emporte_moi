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
        'TextPart'=> "Salut #{current_user.prénom.capitalize}. Merci de ton inscription sur le site ! Tu peux à présent commander autant de plats que tu veux !",
        'HTMLPart'=> "<h1>Salut #{current_user.prénom.capitalize}</h1>. <h2>Merci de ton inscription sur le site ! Tu peux à présent commander autant de plats que tu veux !</h2>"
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
    Order.destroy(current_user.order.id)
    Panier.destroy(current_user.panier.id)
    Plat.destroy(current_user.plats)
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
