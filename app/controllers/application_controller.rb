class ApplicationController < ActionController::Base

  private

  def authorize
    redirect_to login_url, alert: 'Not authorized' if current_user.nil?
  end
end
