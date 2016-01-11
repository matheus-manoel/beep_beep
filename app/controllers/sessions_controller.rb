class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user 
      if user.authenticate(params[:session][:password])
        log_in(user)
        redirect_to(user)
      else
        flash.now[:danger] = "Invalid email/password combination"
        render 'new'
      end
    else
      flash.now[:danger] = "There's no account associated with this email."
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to(root_url)    
  end
end
