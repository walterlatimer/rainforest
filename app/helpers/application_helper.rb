module ApplicationHelper
	def can_edit_review?(review)
		@current_user && (@current_user.has_access?(2) || @current_user == review.user)
	end
end