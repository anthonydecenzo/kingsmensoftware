class SellerController < ApplicationController
	before_action :check_signed_in

  def check_signed_in
  	redirect_to user_session_path if !signed_in?
  end

  # construct two queries -- one to determine how many new orders there are
  # and another to display all sold orders
  def index
  	@orders = Order.where("SellerId = ?", current_user.id)
  	@ordersNew = Order.where("SellerId = ? AND Notified = false", current_user.id)
  end
end
