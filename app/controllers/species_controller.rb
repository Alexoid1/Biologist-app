class SpeciesController < ApplicationController
  before_action :set_species, only: %i[show edit update destroy]
  include ApplicationHelper
  # GET /species
  # GET /species.json
  def index
    @species = Species.all
    @not_followers = User.not_follow(current_user)
    @users = @not_followers.where.not(id: current_user.id).order('created_at DESC') unless current_user.nil?
  end

  def new
    @species = Species.all
    @not_followers = User.not_follow(current_user)
    @users = @not_followers.where.not(id: current_user.id).order('created_at DESC') unless current_user.nil?

    @specie = current_user.species.build
    @user = current_user
  end

  # GET /species/1
  # GET /species/1.json
  def show; end

  # GET /species/new

  # GET /species/1/edit
  def edit; end

  # POST /species
  # POST /species.json
  def create
    @species = current_user.species.build(species_params)

    redirect_to species_index_url, notice: 'Specie post created!' if @species.save
  end

  # PATCH/PUT /species/1
  # PATCH/PUT /species/1.json
  def update
    if @species.update(species_params)
      redirect_to species_path, notice: 'Specie was successfully updated.'

    else
      render :edit

    end
  end

  # DELETE /species/1
  # DELETE /species/1.json
  def destroy
    @species.destroy

    redirect_to species_url, notice: 'Specie was successfully destroyed.'
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
