class UsersController < ApplicationController

  # dashboard
  def show
    @user = current_user
    @applications = Application.where(traveller: current_user)
    @resources = Resource.all
    # raise
  end
  
end
