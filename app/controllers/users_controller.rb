class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
   
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:author_id] = @user.id
      redirect_to opinions_path, notice: 'Thank you for signing up!'
    else
      render 'new'
    end
  end

 

    # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:fullname, :username, :photo, :coverimage)
  end
end
