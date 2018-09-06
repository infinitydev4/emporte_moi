class PlatsController < ApplicationController
    
    def show
        @plat = Plat.find(params[:id])

    end
end
