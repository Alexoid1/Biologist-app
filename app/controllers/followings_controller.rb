class FollowingsController < ApplicationController
  include ApplicationHelper
  def index
    @followings = current_user.followers
  end

  def create
    @following = current_user.followers.create!(following_params)
    
    
    redirect_back(fallback_location: root_path)
   
  end

  def destroy
    following = Following.find(params[:id])
    following.destroy

    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.json { head :no_content }
    end
  end

  def following_params
    params.require(:following).permit(:followed_id)
  end
end