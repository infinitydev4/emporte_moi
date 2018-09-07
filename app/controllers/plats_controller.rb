class PlatsController < ApplicationController
    def show
     @plat=Plat.find(params[:id])
    end
    def new
        @plat = Plat.new
    end

    def edit
    end
    def create
        @panier = Plat.new(plat_params)
    
        respond_to do |format|
          if @panier.save
            format.html { redirect_to @panier, notice: 'Panier was successfully created.' }
            format.json { render :show, status: :created, location: @panier }
          else
            format.html { render :new }
            format.json { render json: @panier.errors, status: :unprocessable_entity }
          end
        end
    end

def update
    respond_to do |format|
      if @plat.update(plat_params)
        format.html { redirect_to @plat, notice: 'Panier was successfully updated.' }
        format.json { render :show, status: :ok, location: @plat }
      else
        format.html { render :edit }
        format.json { render json: @plat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paniers/1
  # DELETE /paniers/1.json
  def destroy
    @plat.destroy
    respond_to do |format|
      format.html { redirect_to plats_url, notice: 'Panier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


end
