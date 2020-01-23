class UsersController < ApplicationController

  # dashboard
  def show
    @user = current_user
  end
  
end
