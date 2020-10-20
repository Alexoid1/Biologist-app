class SpeciesController < ApplicationController
  before_action :set_species, only: [:show, :edit, :update, :destroy]
  include ApplicationHelper
  # GET /species
  # GET /species.json
  def index
    @species = Specie.all
    @not_followers =  User.not_follow(current_user)
    @users= @not_followers.where.not(id: current_user.id).order('created_at DESC') unless current_user.nil?
    
  end

  def new
    @species = Specie.all
    @not_followers =  User.not_follow(current_user)
    @users= @not_followers.where.not(id: current_user.id).order('created_at DESC') unless current_user.nil?
    
    @specie = current_user.species.build
    @user = current_user
  end

  # GET /species/1
  # GET /species/1.json
  def show
  end

  # GET /species/new
 

  # GET /species/1/edit
  def edit
  end

  # POST /species
  # POST /species.json
  def create
    @species = current_user.species.build(species_params)

    
      if @species.save
        redirect_to species_index_url, notice: 'Specie post created!'
      else
        
      end
    
  end

  # PATCH/PUT /species/1
  # PATCH/PUT /species/1.json
  def update
    respond_to do |format|
      if @species.update(species_params)
        format.html { redirect_to species_path, notice: 'Specie was successfully updated.' }
        format.json { render :show, status: :ok, location: @species }
      else
        format.html { render :edit }
        format.json { render json: @species.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /species/1
  # DELETE /species/1.json
  def destroy
    @species.destroy
    respond_to do |format|
      format.html { redirect_to species_url, notice: 'Specie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_species
      @species = Specie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def species_params
      params.require(:species).permit(:specie, :content, :image, :location, :date)
    end
end
