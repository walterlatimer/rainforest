class CartController < ApplicationController

  before_action :find_or_create_cart, :except => [:list]

  def list
    @products = Product.all
  end


# ================= STEPS TO CREATE A CART =================

# Since the cart's contents don't save between pages, we need a way 
# to capture the contents between redirects.

# 1. Create a cart and assign it to a session variable. (find_or_create_cart)
# 2. Add things to that cart. (add_to_cart)
# 3. After we redirect to our show_cart page, the show_cart is 
#    also finding the same cart.

# The cart's contents are stored in the session.
# Rails stores session files in tmp/sessions. We can delete sessions that are too old. 

  def add_to_cart
    product = Product.find(params[:id])
    @cart.add_product(product)
    redirect_to(:action => 'show_cart')
  end


  def show_cart

  end


  # It's tedious to instantiate the cart every time we want to refer to it
  # For that reason we'll use a private method that either finds the cart, or creates
  # a new one. 
  
  private # ---------------------------------------------------

  def find_or_create_cart
    @cart = session[:cart] ||= Cart.new
  end

end

