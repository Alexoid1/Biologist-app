class SessionsController < ApplicationController
  def index; end

  def new; end

  def create
    unless params[:username].present?
      flash[:alert] = 'Please provide username.'
      redirect_to new_session_path
      return
    end
    @user = User.find_by(params[:id])
    if @user
      session[:user_id] = @user.id
      redirect_to opinions_path, notice: 'Logged in!'
    else
      flash.now.alert = 'Username is invalid'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_user_path, notice: 'Logged out!'
  end
end