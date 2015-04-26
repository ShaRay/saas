class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password]) 
      log_in user
      redirect_to dashboard
    else
      redirect_to root_path
    end
  end

  def destroy
  end
end
