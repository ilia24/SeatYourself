class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'Logged in!'
      #redirect_to restaurants_url
    else
      flash.now[:alert] = " Incorrect combination of email and password, try again! "
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out!"
    #redirect_to restaurants_url, notice: "Logged out!"
  end
end
