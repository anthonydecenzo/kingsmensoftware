class DashboardController < ApplicationController

	before_action :check_signed_in

  def index
  end

  def check_signed_in
  	redirect_to user_session_path if !signed_in?
  end
end
