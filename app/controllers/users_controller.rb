class UsersController < ApplicationController

  # dashboard
  def show
    @user = current_user
    @applications = Application.where(traveller: current_user)
    @resources = Resource.all


    # case
    # when @user.is_traveller?
    #   traveller_dashboard
    # when @user.venue_admin?
    #   venue_admin_dashboard
    # else
    #   # Unknown user type? Render error or use a default.
    # end

  end

  def settings
  end
  
  private

  def user_params
    params.require(:user).permit(:id, :profile_image)
  end
  
end
