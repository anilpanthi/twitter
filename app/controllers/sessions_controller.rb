class SessionsController < ApplicationController
  
  def new
  end
  
  def create
     #pulls the user out of database using the submitted email address
     user = User.find_by(email: params[:session][:email].downcase)
     #This uses logical and to determine if resulting user is valid
    if user && user.authenticate(params[:session][:password])
      log_in user
     params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      remember user
      redirect_back_or user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
    
  end
  
  def destroy
     log_out if logged_in?
    redirect_to root_url
  end
end
