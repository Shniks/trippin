class SessionsController < ApplicationController
  def new
  end
  
  def create
    if user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = user.id
      redirect_to search_path
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
