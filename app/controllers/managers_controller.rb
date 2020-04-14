require 'digest'
class ManagersController < ApplicationController

  skip_before_action :authorize

  def new
    @manager = Manager.new
  end

  def create
    params[:manager][:password] = Digest::MD5.hexdigest(params[:manager][:password])
    @manager = Manager.new(manager_params)

    if @manager.save
      newUser = Manager.find_by(email: params[:manager][:email])
      session[:manager_id] = newUser.id
      session[:manager_name] = newUser.name
      redirect_to lessons_path, notice: "Sign up successfully"
    else
      render :new, alert: "Sign up fail, Please check your infomation"
    end
  end

  private
  def manager_params
    params.require(:manager).permit(:name, :email , :password)
  end
end
