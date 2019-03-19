class DashboardController < ApplicationController

	before_action :check_signed_in

	# grab all products being sold by other users and quantity is not zero
  def index
  	@products = Product.where("UserId != ? AND Quantity != 0", current_user.id)
  end

  def check_signed_in
  	redirect_to user_session_path if !signed_in?
  end
end
