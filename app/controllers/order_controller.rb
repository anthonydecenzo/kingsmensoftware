class OrderController < ApplicationController

	before_action :check_signed_in

  def check_signed_in
  	redirect_to user_session_path if !signed_in?
  end
  
  def show
  end

  def destroy
  end

  def index
  	@orders = Order.where(BuyerId: current_user.id)
  end
end
