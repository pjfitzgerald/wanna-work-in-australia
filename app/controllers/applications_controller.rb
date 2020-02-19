class ApplicationsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @applications = Application.where(traveller: @user)
  end

  def show
    @application = Application.find(params[:id])
  end

  def new
    @application = Application.new
  end

  def create
    @application = Application.create!(traveller: current_user)
  end

  private

  def application_params
    params.require(:application).permit(:traveller_id)
  end
  
end
