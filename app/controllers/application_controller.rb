class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def max_editor!
    return if user_signed_in? && current_user.permission_level > 0
    redirect_to new_user_session_path
  end

end
