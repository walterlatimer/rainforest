class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	before_action :get_user, :get_cart, :get_categories

	def get_user
		if session[:user_id]
			@user = User.find(session[:user_id])
		else
			@user = nil
		end
	end

	def get_cart
		session[:cart] ||= Hash.new
	end

	def get_categories
		@categories = Category.all
	end
end
