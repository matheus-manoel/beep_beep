module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Forgets a persistent session.
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # Logs out the current user.
  def log_out
    forget(current_user)
    session[:user_id] = nil
    @current_user = nil
  end

  # Returns the current logged-in user (if any).
  def current_user
    if (session_user_id = session[:user_id]) 
      @current_user ||= User.find_by(id: session_user_id )  #if @current_user is nil => assign.
    elsif (cookies_user_id = cookies.signed[:user_id])
      user = User.find_by(id: cookies_user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in(user)
        @current_user = user
      end
    end
  end

  #  Returns true if there's a user logged in.
  def logged_in?
    !current_user.nil?
  end
  
  # Remember a user in a persistent session.
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = { value: user.id  } # Encrypted (signed) permanent user.
    cookies.permanent[:remember_token] = user.remember_token
  end

end
