class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def index
    @user = User.find(current_user.id)
    @applications = Application.where(traveller: @user)
  end

  def new
    @application = Application.new
  end

  def create
    @application = Application.create!(traveller: current_user)
  end

  private

  def application_params
    params.require(:restaurant).permit(:user_id)
  end
end

