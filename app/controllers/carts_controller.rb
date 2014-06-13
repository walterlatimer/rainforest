class CartsController < ApplicationController

  def add_to_cart

    # Get current quantity of current product you're viewing.
    # @cart = {id: quantity}. So @cart[params[:id]] will return quantity
    # of item at i'th id.

    current_quantity = @cart.@product.id || 0

    # Add the user's updated quantity to the cart. 
    new_quantity = params[:quantity].to_i + current_quantity
    
    # Update session cart to show new quantity.
    @cart[product.id] = quantity + current_quantity
  end

end





# x = {a: 1, b: 2}

# x[:a]

# session[:cart] = {4: 5, 73: 1}
# session[:cart][:4] = 5
# {id: quantity}

