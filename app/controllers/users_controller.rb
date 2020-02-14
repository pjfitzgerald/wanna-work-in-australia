class UsersController < ApplicationController

  # dashboard
  def show
    @user = current_user
    @applications = Application.where(traveller: current_user)
    @resources = Resource.all
    # raise


    # case
    # when @user.is_traveller?
    #   traveller_dashboard
    # when @user.venue_admin?
    #   venue_admin_dashboard
    # else
    #   # Unknown user type? Render error or use a default.
    # end

  end


  private

  def user_params
    params.require(:user).permit(:id)
  end
  
end
