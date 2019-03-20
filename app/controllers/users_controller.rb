class UsersController < ApplicationController

before_action :check_signed_in

  def check_signed_in
  	redirect_to user_session_path if !signed_in?
  end


  def show
  	@user = User.find(params[:id])

  	@product = Product.find(@user.id)

  end
end
