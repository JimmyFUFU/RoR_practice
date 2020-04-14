class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authorize

  private
  def authorize
    unless Manager.find_by(id: session[:manager_id])
      redirect_to admin_login_url, notice: "Please log in"
    end
  end

end
