class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_action :track_action

  def user_allowed?
    if current_user.nil? || !current_user.is_admin?
      redirect_to root_path
    end
  end



  protected

  def track_action
    ahoy.track "Ran action", request.path_parameters
  end

end
