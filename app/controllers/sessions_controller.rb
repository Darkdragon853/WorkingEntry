class SessionsController < ApplicationController
  def new

  end

  def create
    currentUser = User.find_by(email: params[:session][:email].downcase)
    if currentUser && currentUser.authenticate(params[:session][:password])
      log_in(currentUser)
      redirect_to currentUser
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
