class SearchController < ApplicationController
  def new
    @search=Search.new
  end

  def create
    @search= Search.create(search_params)
    redirect_to @search
  end

  def show
    @search= Search.find(params[:id])
  end

private

  def search_params
     params.require(:search).permit(:kerword, :current_user, :category, :min_prix, :max_prix, :prénom, :nom)
  end

end

