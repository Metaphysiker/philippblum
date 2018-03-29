class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def user_allowed?
    if current_user.nil? || !current_user.is_admin?
      redirect_to root_path
    end
  end

end
