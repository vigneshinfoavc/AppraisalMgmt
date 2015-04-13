class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private

  def confirm_login
    if session[:user_id]
      return true
    else
      flash[:notice] = "Please logIn"
      redirect_to(:controller => 'users', :action => 'signin')
      return false
    end
  end
end
