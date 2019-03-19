class SellerController < ApplicationController
  def index
  	@orders = Order.where("SellerId = ? AND Notified = false", current_user.id)
  end
end
