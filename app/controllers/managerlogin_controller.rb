require 'digest'
class ManagerloginController < ApplicationController

  skip_before_action :authorize

  def new
    @managerlogin = Manager.new
  end

  def create
    manager = Manager.find_by(email: params[:manager][:email])
    if manager and manager[:password] == Digest::MD5.hexdigest(params[:manager][:password])
      session[:manager_id] = manager.id
      session[:manager_name] = manager.name
      redirect_to lessons_path
    else
      flash.alert = "User not found."
      puts "User not found"
    end
  end

  def destory
    session[:manager_id] = nil
    redirect_to lessons_path, notice: "Logged out"
  end
end
