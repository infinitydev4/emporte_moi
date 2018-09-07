class PaniersController < ApplicationController
  before_action :set_panier, only: [:show, :edit, :update, :destroy]

  # GET /paniers
  # GET /paniers.json
  def index
    @paniers = Panier.all
  end

  # GET /paniers/1
  # GET /paniers/1.json
  def show
    if Panier.find_by(user_id: current_user.id)
      @panier = Panier.find_by(user_id: current_user.id)
    else
      @panier = Panier.create(user_id: current_user.id)
    end
  end
  def empty
    @Panier = Panier.find_by(user_id: current_user.id)
    @Panier.items.destroy_all
    redirect_to panier_path
  end

  def remove_item
    PaniersItem.destroy(PaniersItem.find_by(item_id: params[:item_id]).id)
    redirect_to Panier_path
  end
  # GET /paniers/new
  def new
    @panier = Panier.new
  end

  # GET /paniers/1/edit
  def edit
  end

  # POST /paniers
  # POST /paniers.json
  def create
    @panier = Panier.new(panier_params)

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

  # PATCH/PUT /paniers/1
  # PATCH/PUT /paniers/1.json
  def update
    respond_to do |format|
      if @panier.update(panier_params)
        format.html { redirect_to @panier, notice: 'Panier was successfully updated.' }
        format.json { render :show, status: :ok, location: @panier }
      else
        format.html { render :edit }
        format.json { render json: @panier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paniers/1
  # DELETE /paniers/1.json
  def destroy
    @panier.destroy
    respond_to do |format|
      format.html { redirect_to paniers_url, notice: 'Panier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_panier
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def panier_params

    end
end
