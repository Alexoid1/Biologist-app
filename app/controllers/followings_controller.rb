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

    redirect_back(fallback_location: root_path)
  end

  def following_params
    params.require(:following).permit(:followedid)
  end
end
