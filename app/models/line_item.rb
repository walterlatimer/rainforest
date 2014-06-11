class LineItem < ActiveRecord::Base

	belongs_to :product
	belongs_to :order


# Line items capture both the product and quantity at the same time.
# A line item connects the orders to products.
# The line item's order value isn't filled out until user actually checks out. 

# This method creates a new line item for a product.
	
	def self.product_line_item( product )
		line_item = self.new
		line_item.product = product
		line_item.quantity = 1
		line_item.price = product.price
		return line_item
	end

end