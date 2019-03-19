class OrderController < ApplicationController
  def show
  end

  def destroy
  end

  def index
  	@orders = Order.where(BuyerId: current_user.id)
  end
end
