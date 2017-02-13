class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "#{user.first_name} #{user.last_name} is Signed In."
      redirect_to links_path
    else
      flash[:alert] = "Unsuccessful Sign In. Please try again."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

end
