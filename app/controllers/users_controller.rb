class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update destroy]
  include ApplicationHelper
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @opinion = current_user.opinions.build
    @opinions = @user.opinions.order('created_at DESC')
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to opinions_path, notice: 'Thank you for signing up!'
    else
      render 'new'
    end
  end

  # Only allow a list of trusted parameters through.
  def set_user
    @user = User.find(params[:id])
  end  
  def user_params
    params.require(:user).permit(:fullname, :username, :photo, :coverimage)
  end
end
