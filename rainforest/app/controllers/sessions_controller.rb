class SessionsController < ApplicationController
  def login
  	if @user
      user.update_attribute(:datetime, Time.now)
  		redirect_to root_path
  	end
  end

  def login_attempt
  	authorized_user = User.authenticate(params[:username],params[:login_password])
  	if authorized_user
  		session[:user_id] = authorized_user.id
  		redirect_to root_path, success: "Welcome back.  You are now logged in as #{authorized_user.username}"
  	else
  		redirect_to :login, error: "Invalid Username or Password"
  	end
  end

	def logout
		session[:user_id] = nil
		redirect_to root_path
	end

  def home
  end

  def profile
  end

  def setting
  end

  # def user_params
  #     params.permit(:username, :password, :password_confirmation, :display, :avatar_url, :access)
  #   end
end
