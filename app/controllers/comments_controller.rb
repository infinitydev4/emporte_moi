class CommentsController < ApplicationController

  def create
    @user = User.find_by(nom:params[:name])
    @comment = Comment.create(titre:params[:comment][:titre], body:params[:comment][:body], user_id: @user.id)
    redirect_to particulier_path(name:@user.nom)
  end

  def create_resto
    @resto = Restaurant.find_by(nom:params[:name])
    @comment = Comment.create(titre:params[:comment][:titre], body:params[:comment][:body], restaurant_id: @resto.id)
    redirect_to restaurant_path(name:@resto.nom)
  end
end
