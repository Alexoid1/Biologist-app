module ApplicationHelper
  def current_user
    return unless session[:user_id]

    @current_user ||= User.find_by_id(session[:user_id])
  end

  def error_flashes
    if flash[:notice]
      content_tag(:p, flash[:notice], class: 'alert alert-success')
    elsif flash[:alert]
      content_tag(:p, flash[:alert], class: 'alert alert-danger')
    end
  end

  
end
