class OpinionsController < ApplicationController
  before_action :set_opinion, only: %i[show edit update destroy]
  before_action :authorize
  include ApplicationHelper
  # GET /opinions
  # GET /opinions.json
  def index
    @opinions = Opinion.all.order('created_at DESC').includes(:user)
    @opinion = current_user.opinions.build
    @not_followers = User.not_follow(current_user)
    @users = @not_followers.where.not(id: current_user.id).order('created_at DESC') unless current_user.nil?
  end

  # GET /opinions/1
  # GET /opinions/1.json
  def show; end

  def current_user
    session[:user_id] && User.find(session[:user_id])
  end

  # GET /opinions/new
  def new
    @opinion = current_user.opinions.build
  end

  # GET /opinions/1/edit
  def edit; end

  # POST /opinions
  # POST /opinions.json
  def create
    @opinion = current_user.opinions.build(opinion_params)

    if @opinion.save
      redirect_to opinions_path, notice: 'Opinion was successfully created.'

    else
      render :index

    end
  end

  # PATCH/PUT /opinions/1
  # PATCH/PUT /opinions/1.json
  def update
    if @opinion.update(opinion_params)
      redirect_to @opinion, notice: 'Opinion was successfully updated.'

    else
      render :edit

    end
  end

  # DELETE /opinions/1
  # DELETE /opinions/1.json
  def destroy
    @opinion.destroy

    redirect_to opinions_url, notice: 'Opinion was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_opinion
    @opinion = Opinion.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def opinion_params
    params.require(:opinion).permit(:opinion)
  end
end
