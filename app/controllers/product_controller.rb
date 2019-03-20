class ProductController < ApplicationController

	# before page load, call if_signed_in method
	before_action :if_signed_in

	# redirects a user to the login page if not logged in
	def if_signed_in
		redirect_to user_session_path if !signed_in?
	end

	# construct a query that returns all records with current user id
  def index
  	@products = Product.where("UserId = ?", current_user.id)
  end

  def show
  	@product = Product.find(params[:id])

  	@user = nil

  	if(@product.UserId != nil)
  		@user = User.find(@product.UserId)
  	end

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
  	@product = Product.find(params[:id])
  end

  def destroy
  	@product = Product.find(params[:id])
  	@product.destroy

  end


  # this is used to edit a product and to purchase a product
  def update
  	
@product = Product.find(params[:id])
  	@product.update(product_params)

		if(@product.Quantity > 0 and @product != nil)
		  	@order = Order.new

		  	@order.SellerId = @product.UserId
		  	@order.BuyerId = current_user.id
		  	@order.ProductId = @product.id
		  	@order.Quantity = 1
		  	@order.Notified = false

		  	@order.save

		  	@product.Quantity = @product.Quantity - 1
		  	@product.save

		  	render 'show'
		  else 
		  	render 'show'
		 end
	
  end

  # strong params are useful for requiring and permitting certain data fields
  def product_params
  	params.require(:product).permit(:Name, :Description, :Quantity, :Price)
  end

end
