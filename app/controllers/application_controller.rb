class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @applications = 
  end

  private

  def application_params
    params.require(:restaurant).permit(:user_id)
  end
end
