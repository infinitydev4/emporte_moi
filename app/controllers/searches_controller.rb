class SearchesController < ApplicationController
    def new
        @search = Search.new
        @categories= Category.pluck(:name)
      end
    
      def create
        @search = Search.create(search_params)
        redirect_to @search
      end
    
      def show
        @search = Search.find(params[:id])
      end
    
    private
    
      def search_params
         params.require(:search).permit(:keyword, :current_user, :category, :min_prix, :max_prix, :prénom, :nom)
      end
    
end
