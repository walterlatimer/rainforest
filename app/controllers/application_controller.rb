class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	before_action :get_user, :get_cart

	def get_user
		if session[:user_id]
			@user = User.find(session[:user_id])
		else
			@user = nil
		end
	end

<<<<<<< HEAD
=======
	def get_cart
		session[:cart] ||= []
		@cart = session[:cart]
	end
>>>>>>> 3f181dc277c766e6cbb66b2ab9061d804fdbe0ec
end
