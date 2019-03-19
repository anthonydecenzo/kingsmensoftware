class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])

  	@product = Product.find(@user.id)

  end
end
