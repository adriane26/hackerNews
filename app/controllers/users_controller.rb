class UsersController < ApplicationController
  def new
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
  		session[:user_id] = @user.id
  		flash[:success] = "you are now a fancy user"
  		redirect_to root_path
  	else 
  		flash[:danger] = "you did something wrong. try again"
  		redirect_to "/signup"

  	end 
  end

  private 

  def user_params
  	params.require(:user).permit(:email, :password, :name)
  end
end
