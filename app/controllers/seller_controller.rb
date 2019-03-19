class SellerController < ApplicationController
  def index
  	@orders = Order.where("SellerId = ?", current_user.id)
  	@ordersNew = Order.where("SellerId = ? AND Notified = false", current_user.id)
  end
end
