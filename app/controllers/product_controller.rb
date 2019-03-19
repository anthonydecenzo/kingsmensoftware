class ProductController < ApplicationController

	# before page load, call if_signed_in method
	before_action :if_signed_in

	# redirects a user to the login page if not logged in
	def if_signed_in
		redirect_to user_session_path if !signed_in?
	end

  def index
  	@product  = Product.all
  end

  def show
  	@product = Product.find(params[:id])
  	@user = User.find(@product.UserId)
  end


  def create
	@product = Product.new(product_params)

	# we can reference the current user who's logged in with
	# current_user.id (that's handy)
	@product[:UserId] = current_user.id

	# check if product is saved to db
	if @product.save
		redirect_to @product
	else
		render 'new'
	end
  end

  def new
  	@product = Product.new
  end

  def edit

  end

  # strong params are useful for requiring and permitting certain data fields
  def product_params
  	params.require(:product).permit(:Name, :Description, :Quantity, :Price)
  end
end
