class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

   def is_authenticated?
  	unless current_user 
  		flash[:danger] = "gotta log in"
  		redirect_to login_path
  	end
  end

  def current_user
  	#creates instance variable for us to use elsewhere
  	@current_user ||= User.find_by_id(session[:user_id])
  	#above is comparison and assignment
  end
end
