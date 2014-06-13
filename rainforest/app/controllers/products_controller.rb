class ProductsController < ApplicationController
	before_action :set_product, only: [:show, :edit, :update, :destroy]

	# GET /products
	# GET /products.json
	# Sorting prefrence for listing products based on session
	def index
		@products = Product.where(featured: true)
		@include_header = true
	end

	def admin
		unless @current_user && @current_user.access >= 3
			redirect_to products_path 
		end
		@products = Product.all
	end

	def all
		@products = case session[:sort_prefrence]
		when :high_to_low
			Product.order(price_in_cents: :desc)
		when :low_to_high
			Product.order(:price_in_cents)
		when :newest
			Product.order(:created_at)
		# when :rating
		#   Product.order(:rating)
		 else
			Product.order(:created_at)
		end
	end

	def search
		if params[:search]
			@products = Product.search(params[:search]).order("created_at DESC")
		else
			@products = Product.all.oder('created_at DESC')
		end
	end

	def order_by
		session[:sort_prefrence] = params[:preference]
		redirect_to @products
	end

	# GET /products/1
	# GET /products/1.json
	def show
		@review = Review.new
	end
	

	# GET /products/new
	def new
		@product = Product.new
	end

	# GET /products/1/edit
	def edit
	end

	# POST /products
	# POST /products.json
	def create
		@product = Product.new(product_params)

		respond_to do |format|
			if @product.save
				format.html { redirect_to @product, success: 'Product was successfully created.' }
				format.json { render :show, status: :created, location: @product }
			else
				format.html { render :new }
				format.json { render json: @product.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /products/1
	# PATCH/PUT /products/1.json
	def update
		respond_to do |format|
			if @product.update(product_params)
				format.html { redirect_to @product, success: 'Product was successfully updated.' }
				format.json { render :show, status: :ok, location: @product }
			else
				format.html { render :edit }
				format.json { render json: @product.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /products/1
	# DELETE /products/1.json
	def destroy
		@product.destroy
		respond_to do |format|
			format.html { redirect_to action: 'admin', notice: 'Product was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_product
		@product = Product.find(params[:id])

		@results = Product.where()
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def product_params # Added a permit for :photo - Frank
		params.require(:product).permit(:name, :price_in_cents, :quantity, :description, :category_id, :photo, :featured)
	end
end
