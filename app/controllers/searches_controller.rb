class SearchesController < ApplicationController

	# Search through database to find matching words using methods from above
	def results
		# Create an empty array that will hold Product instances
		@results = []
		# Push product that was being analized when keyword match was found
		@results << case user_search_for
		# Use method to go through Product instances to find a keyword match
		when product_name_keywords
			# Return Product instance analized
			@product_result
		# Use method to go through Category instances to find a keyword match
		when category_name_keywords
			# Return Product instance analized
			@category_result
		else
		end

		if @results.empty?
			# Can be used later to show an empty results message
		end
	end

private

	# Grabs the user's individual keywords
	def user_search_for
		# Store each keyword into an array
		keywords_array = gets.downcase.split
		# Seach in the array for the individual keywords
		keywords_array.each do |keyword|
			# String is returned when the method is called
			return keyword
		end
	end

	# Grabs the words of individual product names
	def product_name_keywords
		# All Product instances are stored into an array
		products_array = Product.all
		# Search in the array for the individual Product instances
		product_array.each do |product|
			# Grabs the name of the product and splits it into individual keywords that are stored into an array
			product_keywords = product.name.downcase.split
			# Seach in the array for the individualkeywords
			product_keywords.each do |keyword|
			# Store the current analized Product instance into a variable to reference later
			@product_result = product
				# String is returned when the method is called
				return keyword
			end
		end
	end

	# Grabs the names of individual categories
	def category_name_keywords
		# All Product instances are stored into an array
		products_array = Product.all
		#  Search in the array or the individual Product instances
		product_array.each do |product|
			# Grabs the name of the category
			category = product.category
			# Store the current analized Product instance into a variableto refernece later
			@category_result = product
			# String is returned when the method is called
			return category.name
		end
	end

end