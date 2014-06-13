class Cart < ActiveRecord::Base

attr_reader :products, :total_price

	def initialize
		@products = []
		@total_price = 0.0
	end

	def add_product( product )
		@products << LineItem.product_line_item(product)
		@total_price += product.price
	end

end