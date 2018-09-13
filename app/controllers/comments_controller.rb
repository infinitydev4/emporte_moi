class CommentsController < ApplicationController

    def create
        @comment = Comment.create(titre:params[:comment][:titre], body:params[:comment][:body], user_id: current_user.id)
        @user = User.find_by(nom:params[:name])
        redirect_to particulier_path(name:@user.nom)
      end
      

end
