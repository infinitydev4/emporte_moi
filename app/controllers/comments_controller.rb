class CommentsController < ApplicationController

    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = params[:user_id]
        @comment.save
        redirect_to user_path(@comment.user)
      end
      def comment_params
        params.require(:comment).permit(:titre, :body)
      end

end
