class ProductController < ApplicationController
	before_action :if_signed_in

	def if_signed_in
		redirect_to user_session_path if !signed_in?
	end

  def index

  end

  def show

  end

  def new
  	
  end

  def edit
  end
end
