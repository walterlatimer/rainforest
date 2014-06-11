class Product < ActiveRecord::Base
	before_save :default_values
	belongs_to :category
	# has_many :photos, :reviews

	validates :name,           presence: true
	validates :price_in_cents, numericality: {
		                           only_integer: true,
		                           greater_than: 0
		                         }
	validates :quantity,       numericality: {
                               only_integer: true,
                               greater_than_or_equal_to: 0
	                           }
	validates :description,    presence: true
	validates :category,       presence: true

	private
	def default_values
		self.featured ||= false
	end

	def formatted_price
		price_in_dollars = price_in_cents.to_f / 100
		sprintf("%.2f", price_in_dollars)
	end

end
