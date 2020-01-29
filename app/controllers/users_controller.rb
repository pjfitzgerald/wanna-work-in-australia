class UsersController < ApplicationController

  # dashboard
  def show
    @user = current_user
    @applications = Application.where(traveller: current_user)
  end
  
end
