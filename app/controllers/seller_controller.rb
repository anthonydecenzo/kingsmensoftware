class SellerController < ApplicationController
	before_action :check_signed_in

  def check_signed_in
  	redirect_to user_session_path if !signed_in?
  end
  
  def index
  	@orders = Order.where("SellerId = ?", current_user.id)
  	@ordersNew = Order.where("SellerId = ? AND Notified = false", current_user.id)
  end
end
