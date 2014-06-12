class User < ActiveRecord::Base
	before_save :default_values
	has_many :reviews

	validates :username, uniqueness: { case_sensitive: false },
                       presence: true,
                       format: { with: /\A(?=.*[a-z])[a-z\d]+\Z/i },
                       length: { in: 3..15 }
	validates :password, presence: true,
                       confirmation: { message: "failed." },
                       length: { in: 6..20 }
	validates :display,  presence: true,
	                     length: { maximum: 20 }
	# TODO: Validate avatar URL
	validates :access,   numericality: {
		                     only_integer: true,
		                     greater_than: 0,
		                     less_than_or_equal_to: 4
		                   }

	def user_type
		case access
		when 1 then "User"
		when 2 then "Moderator"
		when 3 then "Admin"
		end
	end

	private
	# Access level is 0 by default
	def default_values
		self.access ||= 1
	end

	def self.authenticate(username="", login_password="")
		user = User.find_by_username(username)
		if user && (user.password == login_password)
			return user
		else
			return false
		end
	end
end
