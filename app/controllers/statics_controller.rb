class StaticsController < ApplicationController
  include ApplicationHelper
  def index
    @opinions = Opinion.all.order('created_at DESC')
    @opinion = current_user.opinions.build
    @not_followers = User.not_follow(current_user)
    @users = @not_followers.where.not(id: current_user.id).order('created_at DESC') unless current_user.nil?
  end
end
