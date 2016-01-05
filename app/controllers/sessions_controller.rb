class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.authenticate user_params[:email], user_params[:password]

  	if @user 
  		session[:user_id] = @user.id
  		flash[:success] = "You are now logged in. Welcome and enjoy."
  		redirect_to root_path
  	else 
  		flash[:danger] = "nope. try again."
  		redirect_to login_path
  	end
  end

  def destroy
  	session[:user_id] = nil
  	flash[:notice] = "bye felicia"
  	redirect_to "/login"
  end

  private 

  def user_params

  	#params auto generated when route calls controller. post call
  	params.require(:user).permit(:email, :password)
  end
end
